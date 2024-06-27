import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';

import 'package:kyc_mobile_app/utils/repository.dart';

class ContainerWidget extends StatelessWidget {
  final CameraController? cameraController;
  final XFile? photo;

  const ContainerWidget({super.key, this.cameraController, this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black,
        border: Border.all(color: Repository.navbarColor(context)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16), // Apply rounded corners
        child: cameraController != null
            ? CameraPreview(cameraController!)
            : photo != null
            ? Image.file(File(photo!.path))
            : const SizedBox.shrink(),
      ),
    );
  }
}
