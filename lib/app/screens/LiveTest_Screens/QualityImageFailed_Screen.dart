import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyc_mobile_app/app/screens/LiveTest_Screens/QualityImage_Screen.dart';
import 'package:kyc_mobile_app/app/widgets/buttons.dart';
import 'package:kyc_mobile_app/gen/assets.gen.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class QualityImageFailedScreen extends ConsumerWidget {
  const QualityImageFailedScreen({super.key});

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
            children: [
              SizedBox(height: getProportionateScreenHeight(30)),
              // checkCircle image here with width and height=170
              SvgPicture.asset(
                Assets.images.xCircle,
                width: 170,
                height: 170,
              ),
              SizedBox(height: getProportionateScreenHeight(9)),
              Text(
                "Quality of image\nnot accepted!",
                style: TextStyle(
                  fontSize: 34,
                  color: Repository.blackColor(context),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              //here dynamic change
              Text(
                "There is an issue with the brightness.",
                style: TextStyle(
                  fontSize: 15,
                  color: Repository.blackColor(context),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(323)),
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
                  text: "Re-capture your face",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
