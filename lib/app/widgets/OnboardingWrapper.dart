import 'package:flutter/material.dart';
import 'package:kyc_mobile_app/app/screens/Login_Screens/login_screen.dart';
import 'package:kyc_mobile_app/app/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingWrapper extends StatelessWidget {
  const OnboardingWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingView(
      onFinish: () => _handleGetStarted(context),
    );
  }

  void _handleGetStarted(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("onboarding", true);

    bool onboardingCompleted = prefs.getBool("onboarding") ?? false;
    if (onboardingCompleted) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder:
              (context, animation, secondaryAnimation) =>
                  LoginScreen(),
          transitionsBuilder: (context, animation,
              secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }
}
