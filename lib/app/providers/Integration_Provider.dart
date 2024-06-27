import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/models/IntegrationRequest_model.dart';

final imageProcessProvider =
    StateNotifierProvider<ImageUploadNotifier, IntegrationRequest>((ref) {
  return ImageUploadNotifier();
});

class ImageUploadNotifier extends StateNotifier<IntegrationRequest> {
  ImageUploadNotifier() : super(IntegrationRequest('', 0));

  void setImagePath(String imagePath) {
    state = IntegrationRequest(imagePath, state.type);
  }

  void setType(int type) {
    state = IntegrationRequest(state.imagePath, type);
  }
}
