import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/widgets/LiveTestContainer_Widget.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class QualityImageScreen extends ConsumerWidget {
  const QualityImageScreen({super.key});

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
                'Capturing frames of your face',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600, // Semi-bold
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              const Text(
                'Ensure Your Face is Visible in the Camera',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400, // Semi-bold
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Image quality standards :',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(5)),
              const Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Brightness.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(5)),

              // Line 2: "Matching data"
              const Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Resolution.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
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
                      'Face symmetry (evenness of facial features).',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),

              const Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Sharpness (clarity of the image).',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
