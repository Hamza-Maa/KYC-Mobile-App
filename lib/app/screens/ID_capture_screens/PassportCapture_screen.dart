import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kyc_mobile_app/app/screens/ID_capture_screens/PassportCaptureSecond_screen.dart';
import 'package:kyc_mobile_app/app/widgets/buttons.dart';
import 'package:kyc_mobile_app/app/widgets/camera_container_widget.dart';
import 'package:kyc_mobile_app/app/widgets/capture_button_widget.dart';
import 'package:kyc_mobile_app/app/widgets/my_app_bar.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';


class PassportCaptureScreen extends ConsumerStatefulWidget {
  const PassportCaptureScreen({super.key});

  @override
  _PassportCaptureScreenState createState() => _PassportCaptureScreenState();
}

class _PassportCaptureScreenState extends ConsumerState<PassportCaptureScreen> {
  CameraController? _cameraController;
  late List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Get the list of available cameras
    _cameras = await availableCameras();

    // Choose the back camera
    final CameraDescription backCamera = _cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.back);

    // Initialize the camera controller
    _cameraController = CameraController(
      backCamera,
      ResolutionPreset.high,
    );

    // Listen for initialization state changes
    _cameraController?.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    // Initialize the camera
    await _cameraController?.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    // Dispose of the camera controller
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate proportionate width and height using SizeConfig
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
              // Space between app bar and ContainerWidget
              SizedBox(height: getProportionateScreenHeight(50)),

              // Center the ContainerWidget in the middle of the available space
              if (_cameraController != null &&
                  _cameraController!.value.isInitialized)
                Center(
                  child: ContainerWidget(cameraController: _cameraController!),
                ),
              if (_cameraController == null ||
                  !_cameraController!.value.isInitialized)
                const CircularProgressIndicator(), // Show loading indicator while initializing camera

              SizedBox(height: getProportionateScreenHeight(20)),

              // Text: "Capture the first page"
              const Text(
                'Capture the first page',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600, // Semi-bold
                ),
              ),

              const SizedBox(height: 10), // Space between the texts

              // Text: "Make sure your ID has:"
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Make sure your ID has:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 10), // Space between lines

              // List items
              // Line 1: "Valid MRZ"
              const Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Valid MRZ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

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
                    'Matching data',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Line 3: "Non-expired dates"
              const Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Non-expired dates',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Capture button widget
              if (_cameraController != null &&
                  _cameraController!.value.isInitialized)
                CaptureButtonWidget(
                  cameraController: _cameraController!,
                  onPhotoCaptured: (XFile photo) async {
                    // Upload image when captured using camera
                    await _uploadAndNavigate(context, photo);
                  },
                ),

              const SizedBox(height: 20),
              // Upload button to choose a photo from the gallery
              SizedBox(
                width: getProportionateScreenWidth(167.5),
                height: getProportionateScreenHeight(56),
                child: miniButton(
                  context: context,
                  callback: () async {
                    // Image Picker logic
                    final picker = ImagePicker();
                    XFile? photo =
                    await picker.pickImage(source: ImageSource.gallery);
                    if (photo != null) {
                      // Upload image when selected from gallery
                      await _uploadAndNavigate(context, photo);
                    }
                  },
                  text: "Upload Photo",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _uploadAndNavigate(BuildContext context, XFile photo) async {
    try {
      // Upload image and get the file path


      // Navigate to the second screen with the uploaded photo and file path
      // Navigate to the second screen with the uploaded photo
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PassportCaptureSecondScreen(
            photo: photo,
          ),
        ),
      );

    } catch (e) {
      // Handle upload error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to upload image: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

}
