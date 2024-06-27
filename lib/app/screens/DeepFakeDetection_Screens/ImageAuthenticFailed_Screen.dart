import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyc_mobile_app/app/providers/StepIndicator_provider.dart';
import 'package:kyc_mobile_app/app/widgets/buttons.dart';
import 'package:kyc_mobile_app/app/widgets/step_widget.dart';
import 'package:kyc_mobile_app/gen/assets.gen.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class ImageAuthenticFailedScreen extends ConsumerWidget {
  const ImageAuthenticFailedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    double screenWidth = getProportionateScreenWidth(375);
    double screenHeight = getProportionateScreenHeight(812);
    final steps = ref.watch(stepProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Widget code for displaying image failure message
              Center(
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(20)),
                    SvgPicture.asset(
                      Assets.images.xCircle,
                      width: 170,
                      height: 170,
                    ),
                    SizedBox(height: getProportionateScreenHeight(9)),
                    Text(
                      "The image is not\nauthentic.",
                      style: TextStyle(
                        fontSize: 34,
                        color: Repository.blackColor(context),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Text(
                      "Deepfake was detected.",
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
              // Loop through steps and create StepIndicator widgets
              for (int i = 0; i < steps.length; i++)
                StepIndicator(
                  isComplete: i < 2, // Steps 1 and 2 are complete
                  isFailed: i == 2, // Step 3 is always failed
                  title: steps[i].title,
                  description: steps[i].description,
                  isLastStep: i == steps.length - 1,
                ),

              SizedBox(height: getProportionateScreenHeight(30)),
              // Widget code for retry button
              SizedBox(
                width: double.infinity,
                height: getProportionateScreenHeight(56),
                child: primaryButton(
                  context: context,
                  callback: () {
                    // Handle retry button callback
                  },
                  text: "Retry",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

