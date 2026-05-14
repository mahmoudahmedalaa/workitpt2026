import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'login/data/models/auth_model.dart';
import 'login/data/models/user_model.dart';
import 'login/data/requests/model/user_login_request_model.dart';

class LocalDemoAuth {
  static const _accountsKey = 'localDemoAuth.accounts';

  Future<AuthModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String role,
  }) async {
    final normalizedEmail = email.trim().toLowerCase();
    final accounts = await _readAccounts();
    final account = <String, dynamic>{
      'id': 'local-${DateTime.now().millisecondsSinceEpoch}',
      'firstName': firstName,
      'lastName': lastName,
      'email': normalizedEmail,
      'password': password,
      'role': role.isEmpty ? 'user' : role,
    };
    accounts[normalizedEmail] = account;
    await _writeAccounts(accounts);
    return _authFor(account);
  }

  Future<AuthModel> login(UserLoginRequestModel request) async {
    final normalizedEmail = request.email?.trim().toLowerCase() ?? '';
    final accounts = await _readAccounts();
    final account = accounts[normalizedEmail];
    if (account == null || account['password'] != request.password) {
      throw Exception('Invalid email or password');
    }
    return _authFor(account);
  }

  Future<Map<String, dynamic>> _readAccounts() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_accountsKey);
    if (raw == null || raw.isEmpty) return {};
    return json.decode(raw) as Map<String, dynamic>;
  }

  Future<void> _writeAccounts(Map<String, dynamic> accounts) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accountsKey, json.encode(accounts));
  }

  AuthModel _authFor(Map<String, dynamic> account) {
    final email = account['email'] as String;
    final role = account['role'] as String? ?? 'user';
    final user = UserModel(
      id: account['id'] as String?,
      name: '${account['firstName'] ?? ''} ${account['lastName'] ?? ''}'.trim(),
      email: email,
      role: role,
      status: 'active',
      accessToken: _unsignedJwt(email: email, role: role),
      userSecret: _unsignedJwt(email: email, role: role, secret: true),
      authProvider: 'credentials',
    );
    return AuthModel(
      ok: true,
      message: 'Signed in locally for demo mode',
      user: user,
    );
  }

  String _unsignedJwt({
    required String email,
    required String role,
    bool secret = false,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final header = _encode({'alg': 'none', 'typ': 'JWT'});
    final payload = _encode({
      '_id': 'local-$email',
      'email': email,
      'role': role,
      'demo': true,
      'secret': secret,
      'iat': now,
      'exp': now + 60 * 60 * 24 * 30,
      'iss': 'WorkItPT',
    });
    return '$header.$payload.';
  }

  String _encode(Map<String, dynamic> value) =>
      base64Url.encode(utf8.encode(json.encode(value))).replaceAll('=', '');
}
