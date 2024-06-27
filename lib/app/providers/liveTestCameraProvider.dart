import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final liveTestCameraProvider = FutureProvider<CameraController>((ref) async {
  final cameras = await availableCameras();
  final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
  );
  final controller = CameraController(
    frontCamera,
    ResolutionPreset.medium,
  );
  await controller.initialize();
  return controller;
});
