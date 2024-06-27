import 'package:flutter/material.dart';
import 'package:kyc_mobile_app/app/screens/Login_Screens/login_screen.dart';
import 'package:kyc_mobile_app/app/widgets/OnboardingWrapper.dart';
import 'package:kyc_mobile_app/gen/fonts.gen.dart';

class KYCApp extends StatelessWidget {
  final bool onboarding;

  const KYCApp({super.key, required this.onboarding});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank UI App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: FontFamily.roboto,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: onboarding ? LoginScreen() : const OnboardingWrapper(), //
    );
  }
}
