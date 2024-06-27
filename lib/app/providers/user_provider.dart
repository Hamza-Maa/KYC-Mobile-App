import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/models/user_model.dart';
import 'package:kyc_mobile_app/app/services/User_Services.dart';


final signUpProvider = Provider<SignUpService>((ref) {
  return SignUpService();
});

final signUpDataProvider = StateProvider<SignUpData>((ref) {
  return SignUpData(
    email: '',
    firstName: '',
    lastName: '',
    password: '',
    birthDate: DateTime.now(),
    country: '',
    falsified: null,
  );
});
