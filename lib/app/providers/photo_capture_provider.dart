import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final photoCaptureProvider =
StateNotifierProvider<PhotoCaptureNotifier, XFile?>((ref) {
  return PhotoCaptureNotifier();
});

class PhotoCaptureNotifier extends StateNotifier<XFile?> {
  final ImagePicker _picker = ImagePicker();

  PhotoCaptureNotifier() : super(null);

  // Capture a photo using a camera controller
  Future<void> capturePhoto(CameraController cameraController) async {
    if (cameraController.value.isInitialized) {
      XFile? photo = await cameraController.takePicture();
      state = photo;
    }
  }

  // Upload a photo from the gallery
  Future<void> uploadPhoto() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    state = photo;
  }

  // Set a new photo (used for retake action)
  void setPhoto(XFile? photo) {
    state = photo;
  }
}
