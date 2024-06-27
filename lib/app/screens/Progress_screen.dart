import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/providers/StepIndicator_provider.dart';
import 'package:kyc_mobile_app/app/screens/Signup_screens/SignupOne_screen.dart';
import 'package:kyc_mobile_app/app/widgets/buttons.dart';
import 'package:kyc_mobile_app/app/widgets/my_app_bar.dart';
import 'package:kyc_mobile_app/app/widgets/step_widget.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    // Calculate proportionate width and height
    double screenWidth = getProportionateScreenWidth(375);
    double screenHeight = getProportionateScreenHeight(812);

    // Access the list of step states from the provider
    final steps = ref.watch(stepProvider);

    return Scaffold(
      appBar: appBarWidget(context),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign Up in Three Simple Steps",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Repository.headerColor(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(85)),

              // Vertical step indicator
              // Display each step with its title and description
              Column(
                children: [
                  for (int i = 0; i < steps.length; i++)
                    StepIndicator(
                      isComplete: steps[i].isComplete,
                      isFailed: steps[i].isFailed,
                      title: steps[i].title,
                      description: steps[i].description,
                      isLastStep: i == steps.length - 1,
                    ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(95)),
              SizedBox(
                width: double.infinity,
                height: getProportionateScreenHeight(56),
                child: primaryButton(
                  context: context,
                  callback: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                        const SignUpOneScreen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  text: "Got it",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
