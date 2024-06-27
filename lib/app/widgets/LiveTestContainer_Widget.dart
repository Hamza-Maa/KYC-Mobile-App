import 'package:flutter/material.dart';
import 'package:flutter_mediapipe/flutter_mediapipe.dart';
import 'package:flutter_mediapipe/gen/landmark.pb.dart';
import 'package:kyc_mobile_app/app/screens/LiveTest_Screens/QualityImageSuccess_Screen.dart';

class LiveTestContainerWidget extends StatefulWidget {
  const LiveTestContainerWidget({super.key});

  @override
  _LiveTestContainerWidgetState createState() =>
      _LiveTestContainerWidgetState();
}

class _LiveTestContainerWidgetState extends State<LiveTestContainerWidget> {
  bool faceDetected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 255,
      height: 314,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: Colors.black,
        border: Border.all(
            color: Colors.white), // Change this to your desired border color
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(400),
        child: NativeView(
          onViewCreated: (FlutterMediapipe c) {
            c.landMarksStream.listen(_onLandMarkStream);
            c.platformVersion.then((content) => print(content));
          },
        ),
      ),
    );
  }

  void _onLandMarkStream(NormalizedLandmarkList landmarkList) {
    // Assuming face detected if landmarkList is not empty
    if (landmarkList.landmark.isNotEmpty && !faceDetected) {
      setState(() {
        faceDetected = true;
      });

      // Wait for 5 seconds before navigating to other screen
      Future.delayed(const Duration(seconds: 5), () {
        if (mounted) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const QualityImageSuccessScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        }
      });
    }
  }
}



//without mediapipe
//////////////////////////////////////
/*
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class LiveTestContainerWidget extends StatefulWidget {
  const LiveTestContainerWidget({super.key});

  @override
  _LiveTestContainerWidgetState createState() =>
      _LiveTestContainerWidgetState();
}

class _LiveTestContainerWidgetState extends State<LiveTestContainerWidget> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get the first available camera, which is usually the front camera.
    final frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    // Initialize the camera controller
    _controller = CameraController(
      frontCamera,
      ResolutionPreset.medium,
    );

    // Initialize the camera controller future
    _initializeControllerFuture = _controller.initialize();

    if (!mounted) return;

    setState(() {});
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 255,
      height: 314,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: Colors.black,
        border: Border.all(
            color: Colors.white), // Change this to your desired border color
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(400),
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the Future is complete, display the camera preview.
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: CameraPreview(_controller),
              );
            } else {
              // Otherwise, display a loading indicator.
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

 */
///////////////////////////////////////////////////////