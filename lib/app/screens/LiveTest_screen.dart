import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyc_mobile_app/app/screens/LiveTest_Screens/QualityImage_Screen.dart';
import 'package:kyc_mobile_app/app/widgets/buttons.dart';
import 'package:kyc_mobile_app/gen/assets.gen.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class LiveTestScreen extends ConsumerWidget {
  const LiveTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    // Calculate proportionate width and height
    double screenWidth = getProportionateScreenWidth(375);
    double screenHeight = getProportionateScreenHeight(812);

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
              SizedBox(height: getProportionateScreenHeight(106)),
              Center(
                child: SvgPicture.asset(
                  Assets.images.identityCard,
                  width: getProportionateScreenWidth(200),
                  height: getProportionateScreenHeight(150),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(44)),
              Text(
                "Now time for a photo of you for\na live test",
                style: TextStyle(
                  fontSize: 24,
                  color: Repository.blackColor(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(16)),

              // Check circle outline icon with text lines
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Repository.iconColor(context),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Expanded(
                    child: Text(
                      "We will capture several frames of your face.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Repository.blackColor(context),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Repository.iconColor(context),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Expanded(
                    child: Text(
                      "Ensure that the image quality meets our standards.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Repository.blackColor(context),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10)),



              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Repository.iconColor(context),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Expanded(
                    child: Text(
                      "We will conduct tests for smiling, blinking, head pose estimation, and finger counting.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Repository.blackColor(context),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: getProportionateScreenHeight(110)),
              SizedBox(
                width: double.infinity,
                height: getProportionateScreenHeight(56),
                child: primaryButton(
                  context: context,
                  callback: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                        const QualityImageScreen(),
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
