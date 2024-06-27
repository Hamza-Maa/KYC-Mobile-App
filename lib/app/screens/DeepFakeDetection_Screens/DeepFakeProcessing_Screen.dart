import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyc_mobile_app/app/screens/DeepFakeDetection_Screens/ImageAuthenticSucceeded_Screen.dart';
import 'package:kyc_mobile_app/app/widgets/Custom_notification.dart';
import 'package:kyc_mobile_app/gen/assets.gen.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class DeepFakeProcessingScreen extends ConsumerWidget {
  const DeepFakeProcessingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    // Calculate proportionate width and height
    double screenWidth = getProportionateScreenWidth(375);
    double screenHeight = getProportionateScreenHeight(812);

    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: getProportionateScreenHeight(106)),
              SvgPicture.asset(
                Assets.images.deepFakeLogo,
                width: 150,
                height: 170,
              ),
              SizedBox(height: getProportionateScreenHeight(44)),
              Text(
                "Thanks, we’re just analyzing your image...",
                style: TextStyle(
                  fontSize: 24,
                  color: Repository.blackColor(context),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                "We'll analyze all the previous images for deepfake detection. This ensures the integrity of your photo and prevents fraudulent manipulation.",
                style: TextStyle(
                  fontSize: 15,
                  color: Repository.blackColor(context),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(225)),
              CustomNotification(
                text: "Our model will take few seconds\nto analyze the images.",
                icon: Icons.help_outline,
                onTap: () {
                  // Add your onTap logic here if needed
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const ImageAuthenticSucceededScreen(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
