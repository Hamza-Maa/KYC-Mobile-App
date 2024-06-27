import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/screens/Signup_screens/SignupThree_screen.dart';
import 'package:kyc_mobile_app/app/widgets/buttons.dart';
import 'package:kyc_mobile_app/app/widgets/my_app_bar.dart';
import 'package:kyc_mobile_app/gen/assets.gen.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class SignUpTwoScreen extends ConsumerWidget {
  const SignUpTwoScreen({super.key});

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
              //gif here
              Center(
                child: Image.asset(
                  Assets.gifs.securityOn
                      .path, // Use the GIF from your assets manager
                  width: getProportionateScreenWidth(180),
                  height: getProportionateScreenHeight(180), // Adjust the height as needed
                  fit: BoxFit.cover, // Adjust fit as needed
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(32)),
              Text(
                "To make sure it’s really you, we check your application against a photo of your ID and a photo of you",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Repository.headerColor(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(24)),
              Text(
                "That way, we can be sure someone isn’t trying to set up an account in your name.",
                style: TextStyle(
                  fontSize: 16,
                  color: Repository.subTextColor(context),
                ),
              ),

              SizedBox(height: getProportionateScreenHeight(180)),
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
                            const SignupThreeScreen(),
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
