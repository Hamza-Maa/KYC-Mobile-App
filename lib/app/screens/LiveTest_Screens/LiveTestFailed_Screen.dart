import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyc_mobile_app/app/providers/StepIndicator_provider.dart';
import 'package:kyc_mobile_app/app/widgets/buttons.dart';
import 'package:kyc_mobile_app/app/widgets/step_widget.dart';
import 'package:kyc_mobile_app/gen/assets.gen.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class LiveTestFailedScreen extends ConsumerWidget {
  const LiveTestFailedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    // Calculate proportionate width and height
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
                    // checkCircle image here with width and height=170
                    SvgPicture.asset(
                      Assets.images.xCircle,
                      width: 170,
                      height: 170,
                    ),
                    SizedBox(height: getProportionateScreenHeight(9)),
                    Text(
                      "Processing\nFailed!",
                      style: TextStyle(
                        fontSize: 34,
                        color: Repository.blackColor(context),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Text(
                      "Now that we have verified your ID, let's move on\nto the next step.",
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
              for (int i = 0; i < steps.length; i++)
                StepIndicator(
                  isComplete: (i == 0), // Set first step as complete
                  isFailed: (i == 1), // Set second step as failed
                  title: steps[i].title,
                  description: steps[i].description,
                  isLastStep: i == steps.length - 1,
                ),

              SizedBox(height: getProportionateScreenHeight(30)),
              SizedBox(
                width: double.infinity,
                height: getProportionateScreenHeight(56),
                child: primaryButton(
                  context: context,
                  callback: () {
                  /*  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                        const (),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );*/
                  },
                  text: "Next",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
