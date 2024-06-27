import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/screens/LiveTest_Screens/Test_Screens/SmileDetection_Screen.dart';
import 'package:kyc_mobile_app/app/widgets/Custom_notification.dart';
import 'package:kyc_mobile_app/app/widgets/LiveTestContainer_Widget.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class MaskDetectionScreen extends ConsumerWidget {
  const MaskDetectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    // Calculate proportionate width and height
    double screenWidth = getProportionateScreenWidth(375);
    double screenHeight = getProportionateScreenHeight(812);

    return Scaffold(
      backgroundColor: Repository.blackColor(context),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(60)),
              //LiveTestContainerWidget here
              const Center(child: LiveTestContainerWidget()),
              SizedBox(height: getProportionateScreenHeight(18)),
              const Text(
                'Mask detection',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600, // Semi-bold
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              const Text(
                'Mask Must Be Removed to Proceed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400, // Semi-bold
                ),

              ),
              SizedBox(height: getProportionateScreenHeight(240)),
              CustomNotification(
                text: "Mask not detected. Initiating smile test.",
                icon: Icons.help_outline,
                onTap: () {
                  // Add your onTap logic here if needed
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                      const SmileDetectionScreen(),
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
