import 'package:bson/bson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyc_mobile_app/app/providers/StepIndicator_provider.dart';
import 'package:kyc_mobile_app/app/providers/StoredID_provider.dart';
import 'package:kyc_mobile_app/app/providers/user_provider.dart';
import 'package:kyc_mobile_app/app/screens/Signup_screens/SignupThree_screen.dart';
import 'package:kyc_mobile_app/app/services/User_Services.dart';
import 'package:kyc_mobile_app/app/widgets/buttons.dart';
import 'package:kyc_mobile_app/app/widgets/step_widget.dart';
import 'package:kyc_mobile_app/gen/assets.gen.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class ProcessingFailedScreen extends ConsumerWidget {
  final bool falsified;
  final String errorMSG;
  const ProcessingFailedScreen({super.key, required this.falsified, required this.errorMSG});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    double screenWidth = getProportionateScreenWidth(375);
    double screenHeight = getProportionateScreenHeight(812);

    // Retrieve the list of steps from the stepProvider
    final steps = ref.watch(stepProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(20)),
                    // XCircle image asset for failed screen
                    SvgPicture.asset(
                      Assets.images.xCircle,
                      width: 170,
                      height: 170,
                    ),
                    SizedBox(height: getProportionateScreenHeight(9)),
                    Text(
                      "Processing\nfailed!",
                      style: TextStyle(
                        fontSize: 34,
                        color: Repository.blackColor(context),
                      ),
                      textAlign: TextAlign.center,
                    ),
          SizedBox(height: getProportionateScreenHeight(10)),
                    Text(
                      errorMSG,
                      style: TextStyle(
                        fontSize: 15,
                        color: Repository.blackColor(context),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              // Display the steps using StepIndicator widgets
              // Iterate through the list of steps and create StepIndicator for each step
              for (int i = 0; i < steps.length; i++)
                StepIndicator(
                  isComplete: steps[i].isComplete,
                  isFailed: i == 0, // Only the first step is failed (red)
                  title: steps[i].title,
                  description: steps[i].description,
                  isLastStep:
                      i == steps.length - 1, // Check if it's the last step
                ),
              SizedBox(height: getProportionateScreenHeight(30)),
              SizedBox(
                width: double.infinity,
                height: getProportionateScreenHeight(56),
                child: primaryButton(
                  context: context,
                  callback: () async {
                    // Get the stored ID
                    ObjectId? id = ref.watch(idProvider.notifier).state;
                    // Get the signUpService instance
                    SignUpService signUpService = ref.read(signUpProvider);
                    // Call the updateFalsified method from the signUpService
                    await signUpService.updateFalsified(id!, falsified);
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                             const SignupThreeScreen(),
                        transitionsBuilder: (context, animation,
                            secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  text: "Re-select ID",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
