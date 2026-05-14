import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/export.dart';
import '../../../../../../core/injection/injection.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_text_field.dart';
import '../../../../../../core/widgets/base_view.dart';
import '../../../../../config/typography.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/svg_icon_button.dart';
import '../../../../profile/presentation/bloc/profile_bloc.dart';
import '../../social/presentation/social_bloc.dart';
import '../bloc/auth_bloc.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key, this.continueAfterSuccess = false});

  final bool continueAfterSuccess;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  _LoginViewState()
      : authBloc = getIt<AuthBloc>(),
        socialBloc = getIt<SocialBloc>(),
        profileBloc = getIt<ProfileBloc>();

  final AuthBloc authBloc;
  final SocialBloc socialBloc;
  final ProfileBloc profileBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => authBloc,
          ),
          BlocProvider(
            create: (context) => socialBloc,
          ),
          BlocProvider(
            create: (context) => profileBloc,
          ),
        ],
        child: BaseView(
            hideAppBar: true,
            padding: EdgeInsets.zero,
            color: Colors.white,
            body: Form(
              key: _formKey,
              child: SizedBox(
                height: 100.h,
                width: 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Assets.images.loginBg.path,
                      fit: BoxFit.cover,
                      height: 35.h,
                      width: 100.w,
                    ),
                    Expanded(
                        child: SignInForm(
                      formKey: _formKey,
                      authBloc: authBloc,
                      profileBloc: profileBloc,
                      socialBloc: socialBloc,
                    )),
                  ],
                ),
              ),
            )),
      );
}

class SignInForm extends StatelessWidget {
  SignInForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.authBloc,
    required this.socialBloc,
    required this.profileBloc,
  }) : _formKey = formKey;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthBloc authBloc;
  final SocialBloc socialBloc;
  final ProfileBloc profileBloc;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: MultiBlocListener(
            listeners: [
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  state.whenOrNull(
                    onLoading: () {
                      EasyLoading.show(dismissOnTap: true);
                    },
                    onSuccess: (user) {
                      profileBloc.add(const ProfileEvent.getProfile());
                    },
                    onFailure: (message) {
                      EasyLoading.showInfo(message);
                    },
                  );
                },
              ),
              BlocListener<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  state.whenOrNull(
                    onLoading: () {
                      EasyLoading.show(dismissOnTap: true);
                    },
                    onGetProfileSuccess: (model) {
                      EasyLoading.dismiss();
                      if (model.status == 'INACTIVE') {
                        context.router.popUntilRoot();
                        context.router
                            .replace(DashboardRoute(role: model.role!));
                        context.router.push(VerifyNumberRoute(
                            role: model.role!, mail: emailController.text));
                      } else if (model.status == 'ACTIVE' &&
                          model.profileCompleted == false) {
                        if (model.role == 'USER') {
                          context.router.popUntilRoot();
                          context.router.replace(DashboardRoute(role: 'USER'));
                          context.router.push(const SignupAdditionalRoute());
                        } else if (model.role == 'TRAINER') {
                          context.router.popUntilRoot();
                          context.router
                              .replace(DashboardRoute(role: 'TRAINER'));
                          context.router.push(const SignupTrainerRoute());
                        }
                      } else if (model.status == 'ACTIVE' &&
                          model.profileCompleted!) {
                        context.router.popUntilRoot();
                        context.router
                            .replace(DashboardRoute(role: model.role!));
                      }
                      EasyLoading.showSuccess('Successfully logged in.');
                    },
                    onFailure: (message) {
                      EasyLoading.showError(message!);
                    },
                  );
                },
              ),
            ],
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Let's Sign You In.",
                    style: AppTextStyle.titleMDSemiBold,
                  ),
                  verticalMargin8,
                  Text(
                    'Welcome back, you’ve been missed!',
                    style: AppTextStyle.bodySMRegular.copyWith(
                      color: darkText,
                    ),
                  ),
                  verticalMargin32,
                  AppTextField(
                    controller: emailController,
                    labelText: 'Email Address',
                    hintText: 'Enter your email address',
                    prefixIcon: Assets.icons.email.path,
                    textColor: colorPrimary,
                    validator: validateEmail,
                    textInputType: TextInputType.emailAddress,
                  ),
                  AppTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    obscureText: true,
                    validator: validatePassword,
                    prefixIcon: Assets.icons.password.path,
                    textColor: colorPrimary,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: AppTextButton(
                        onTap: () {
                          context.router.push(const ForgotPasswordRoute());
                        },
                        text: 'Forgot Password?',
                      )),
                  verticalMargin24,
                  AppButton(
                    padding: EdgeInsets.zero,
                    buttonWidth: ButtonWidth.large,
                    buttonText: 'Login',
                    backgroundColor: colorPrimary,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authBloc.add(AuthEvent.doLogin(
                            email: emailController.text,
                            pass: passwordController.text));
                      }
                    },
                  ),
                  verticalMargin12,
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Divider(
                          thickness: 1, // Customize divider thickness
                          color: Colors.grey, // Customize divider color
                        ),
                        Container(
                          color: Colors.white,
                          padding: allPadding8,
                          child: const Text(
                            'Or', // Your text here
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocListener<SocialBloc, SocialState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        onLoading: () {
                          EasyLoading.show(dismissOnTap: true);
                        },
                        onSuccess: (user) {
                          EasyLoading.showSuccess('Successfully logged in.');
                          profileBloc.add(const ProfileEvent.getProfile());
                          // context.router.popAndPush(
                          //     DashboardRoute(role: user.user!.role!));
                          // if (user.user!.status == 'INACTIVE') {
                          //   context.router.popAndPush(VerifyNumberRoute(
                          //       role: user.user!.role!,
                          //       mail: emailController.text));
                          // }
                        },
                        onFailure: (message) {
                          EasyLoading.showInfo(message);
                        },
                      );
                    },
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SvgIconButton(
                            svgPath: 'assets/icons/fb_icon.svg',
                            onPressed: () {
                              socialBloc.add(
                                const SocialEvent.doSocialLogin(
                                    socialType: SocialType.Facebook),
                              );
                            },
                          ),
                          horizontalMargin16,
                          SvgIconButton(
                            svgPath: 'assets/icons/google_icon.svg',
                            onPressed: () {
                              socialBloc.add(
                                const SocialEvent.doSocialLogin(
                                    socialType: SocialType.Google),
                              );
                            },
                          ),
                          if (Platform.isIOS) ...[
                            horizontalMargin16,
                            SvgIconButton(
                              svgPath: 'assets/icons/apple.svg',
                              iconColor: Colors.black,
                              onPressed: () {
                                socialBloc.add(
                                  const SocialEvent.doSocialLogin(
                                      socialType: SocialType.Apple),
                                );
                              },
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.router.push(const SignupRoute());
                    },
                    child: Padding(
                      padding: allPadding12,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account?",
                            style: AppTextStyle.bodyMDRegular.copyWith(
                              color: darkText,
                            ),
                          ),
                          Text(
                            ' Sign Up',
                            style: AppTextStyle.bodyMDRegular
                                .copyWith(color: colorPrimary),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
