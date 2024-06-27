import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/models/user_model.dart';
import 'package:kyc_mobile_app/app/services/User_Services.dart';

final loginProvider = Provider<LoginService>((ref) {
  return LoginService();
});

class LoginService {
  final SignUpService _signUpService = SignUpService();

  Future<SignUpData?> login(String email, String password) async {
    return _signUpService.login(email, password);
  }
}
