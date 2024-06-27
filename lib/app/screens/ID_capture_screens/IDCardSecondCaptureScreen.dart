import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/screens/Processing_ID_Screens/ProcessingList_scrreen.dart';
import 'package:kyc_mobile_app/app/widgets/buttons.dart';
import 'package:kyc_mobile_app/app/widgets/camera_container_widget.dart';
import 'package:kyc_mobile_app/app/widgets/my_app_bar.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class IDCardSecondCaptureScreen extends ConsumerStatefulWidget {
  final XFile photo;

  const IDCardSecondCaptureScreen({super.key, required this.photo});

  @override
  PassportCaptureSecondScreenState createState() =>
      PassportCaptureSecondScreenState();
}

class PassportCaptureSecondScreenState
    extends ConsumerState<IDCardSecondCaptureScreen> {



  @override
  Widget build(BuildContext context) {
    double screenWidth = getProportionateScreenWidth(375);
    double screenHeight = getProportionateScreenHeight(812);
    return Scaffold(
      backgroundColor: Repository.blackColor(context),
      appBar: appBarWidget(
        context,
        backgroundColor: Repository.blackColor(context),
        arrowColor: Colors.white,
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(50)),
              ContainerWidget(photo: widget.photo),
              SizedBox(height: getProportionateScreenHeight(20)),
              const Text(
                'Is your ID clear ?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600, // Semi-bold
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              const Text(
                'Make sure it’s well-lit, clear, and nothing is cut off.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500, // Semi-bold
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(170)),
              SizedBox(
                width: double.infinity,
                height: getProportionateScreenHeight(56),
                child: primaryButton(
                  context: context,
                  callback: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProcessingListScreen(photo: widget.photo,type: 0,),
                      ),
                    );
                  },
                  text: "Submit Photo",
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(12)),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Retake Photo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
