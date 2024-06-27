import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/screens/ID_capture_screens/IDCardFirstCaptureScreen.dart';
import 'package:kyc_mobile_app/app/screens/ID_capture_screens/PassportCapture_screen.dart';
import 'package:kyc_mobile_app/app/widgets/CustomListTile_widget.dart';
import 'package:kyc_mobile_app/app/widgets/Custom_notification.dart';
import 'package:kyc_mobile_app/app/widgets/my_app_bar.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class SignupThreeScreen extends ConsumerWidget {
  const SignupThreeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    // Calculate proportionate width and height
    double screenWidth = getProportionateScreenWidth(375);
    double screenHeight = getProportionateScreenHeight(812);

    return Scaffold(
      appBar: appBarWidget(context),
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
              SizedBox(height: getProportionateScreenHeight(12)),
              Text(
                "Photo of your ID",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Repository.headerColor(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(16)),
              Text(
                "Choose which type of document you’re going to use.",
                style: TextStyle(
                  fontSize: 15,
                  color: Repository.subTextColor(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(16)),
              Text(
                "Use a document that is in date or has expired in the last three months.",
                style: TextStyle(
                  fontSize: 15,
                  color: Repository.subTextColor(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(16)),
              CustomListTile(
                text: "ID Card",
                icon: Icons.arrow_forward_rounded,
                onTap: () {
                  // Add your onTap logic here
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                      const IDCardFirstCaptureScreen (),
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
              SizedBox(height: getProportionateScreenHeight(16)),
              CustomListTile(
                text: "Passport",
                icon: Icons.arrow_forward_rounded,
                onTap: () {

                  Navigator.push(
                    context,

                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const PassportCaptureScreen(),
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
              SizedBox(height: getProportionateScreenHeight(250)),
              CustomNotification(
                text: "Your ID photo will be stored securely.",
                icon: Icons.lock, // Lock icon
                onTap: () {
                  // Add your onTap logic here if needed
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
