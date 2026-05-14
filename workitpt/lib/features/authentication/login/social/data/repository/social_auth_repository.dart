import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../session/i_session_manager.dart';
import '../../../data/models/auth_model.dart';
import '../../../domain/repositories/i_auth_repository.dart';
import 'i_social_repository.dart';

@Injectable(as: ISocialAuthRepository)
class SocialAuthRepository implements ISocialAuthRepository {
  final IAuthRepository repository;
  final ISessionManager iSessionManager;

  SocialAuthRepository(this.repository, this.iSessionManager);

  @override
  Future<Either<String, AuthModel>> facebookLogin() async {
    try {
      final result = await FacebookAuth.instance
          .login(); // by default we request the email and the public profile
      switch (result.status) {
        case LoginStatus.success:
          final accessToken = result.accessToken;
          final response =
              await repository.loginWithFacebook(token: accessToken!.token);
          response.fold((l) => l, (r) {
            if (r.user!.accessToken != null) {
              iSessionManager.saveToken(accessToken: r.user!.accessToken!);
            }
            if (r.user!.userSecret != null) {
              iSessionManager.saveUserSecret(userSecret: r.user!.userSecret!);
            }
            if (r.user != null) {
              iSessionManager.saveCurrentUser(user: r.user!);
            }
          });
          return response;
        case LoginStatus.failed:
          return left('Failed');
        case LoginStatus.cancelled:
          return left('Cancelled');
        case LoginStatus.operationInProgress:
          return left('In Progress');
      }
    } catch (e) {
      debugPrint(e.toString());
      return left('In Progress');
    }
  }

  @override
  Future<Either<String, AuthModel>> googleLoginIn() async {
    final googleSignIn = GoogleSignIn(scopes: ['email']);
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    }
    try {
      final googleSignInAccount = await googleSignIn.signIn();
      final authentication = await googleSignInAccount!.authentication;
      if (authentication.accessToken == null) {
        return left('Sign in cancelled');
      } else {
        final model = await repository.loginWithGoogle(
            token: authentication.accessToken!);
        debugPrint(authentication.accessToken);
        debugPrint(authentication.idToken);
        model.fold((l) => l, (r) {
          if (r.user!.accessToken != null) {
            iSessionManager.saveToken(accessToken: r.user!.accessToken!);
          }
          if (r.user!.userSecret != null) {
            iSessionManager.saveUserSecret(userSecret: r.user!.userSecret!);
          }
          if (r.user != null) {
            iSessionManager.saveCurrentUser(user: r.user!);
          }
        });
        return model;
      }
    } catch (e) {
      debugPrint(e.toString());
      return left('Unable to sign in.');
    }
  }

  @override
  Future<Either<String, AuthModel>> appleLoginIn() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final model =
          await repository.loginWithApple(token: credential.identityToken!);
      model.fold((l) => l, (r) {
        if (r.user!.accessToken != null) {
          iSessionManager.saveToken(accessToken: r.user!.accessToken!);
        }
        if (r.user!.userSecret != null) {
          iSessionManager.saveUserSecret(userSecret: r.user!.userSecret!);
        }
        if (r.user != null) {
          iSessionManager.saveCurrentUser(user: r.user!);
        }
      });
      return model;
    } catch (e) {
      return left('Unable to sign in.');
    }
  }
}
