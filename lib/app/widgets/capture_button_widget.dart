import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CaptureButtonWidget extends StatelessWidget {
  final CameraController cameraController;
  final Function(XFile) onPhotoCaptured;

  const CaptureButtonWidget({
    super.key,
    required this.cameraController,
    required this.onPhotoCaptured,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (cameraController.value.isInitialized) {
          XFile photo = await cameraController.takePicture();
          onPhotoCaptured(photo);
        }
      },
      child: Center(
        child: Container(
          // Outer circle
          width: 72, // Adjust the width to be a little larger than 64
          height: 72, // Adjust the height to be a little larger than 64
          decoration: const BoxDecoration(
            color: Colors.blueGrey, // Grey color for the outer circle
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              // Inner circle
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: Color(0xFFCDCDCD), // Color "CDCDCD" for the inner circle
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
