import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/models/forgetPass_model.dart';
import 'package:kyc_mobile_app/app/services/User_Services.dart';

final forgetPasswordProvider =
    FutureProvider.autoDispose.family<void, String>((ref, email) async {
  final signUpService = SignUpService();
  final emailExists = await signUpService.doesEmailExist(email);
  if (!emailExists) {
    throw Exception("Email does not exist");
  }
});

final recoverPasswordProvider = FutureProvider.autoDispose
    .family<void, PasswordModel>((ref, signUpData) async {
  final signUpService = SignUpService();
  await signUpService.updatePassword(signUpData.email, signUpData.password);
});
