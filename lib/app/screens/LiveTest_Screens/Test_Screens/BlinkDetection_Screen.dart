import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/screens/LiveTest_Screens/Test_Screens/HeadPoseEstimation_Screen.dart';
import 'package:kyc_mobile_app/app/widgets/Custom_notification.dart';
import 'package:kyc_mobile_app/app/widgets/LiveTestAppBar_Widget.dart';
import 'package:kyc_mobile_app/app/widgets/LiveTestContainer_Widget.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class BlinkDetectionScreen extends ConsumerWidget {
  const BlinkDetectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    // Calculate proportionate width and height
    double screenWidth = getProportionateScreenWidth(375);
    double screenHeight = getProportionateScreenHeight(812);

    return Scaffold(
      backgroundColor: Repository.blackColor(context),
      resizeToAvoidBottomInset: false,
      appBar: LiveTestAppBarWidget(
        leftText: 'Cancel',
        rightText: 'Blinks: 11',
        onLeftPressed: () {
          // Add your left button press logic here
        },

      ),
      body: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(10)),
              //LiveTestContainerWidget here
              const Center(child: LiveTestContainerWidget()),
              SizedBox(height: getProportionateScreenHeight(18)),
              const Text(
                'Blink Detection',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600, // Semi-bold
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(23)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  const Expanded(
                    child: Text(
                      """First, we'll check if you're wearing glasses.""",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  const Expanded(
                    child: Text(
                      """Then, we'll proceed with the blink test detection(11 times).""",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(100)),
              CustomNotification(
                text: "Blink detected.\nNext: Head pose estimation.",
                icon: Icons.help_outline,
                onTap: () {
                  // Add your onTap logic here if needed
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                      const HeadPoseEstimation(),
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
