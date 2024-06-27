import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final idCardProvider = StateNotifierProvider<IDCardNotifier, IDCardState>(
      (ref) => IDCardNotifier(),
);

class IDCardState {
  final XFile? frontPhoto;
  final XFile? backPhoto;

  IDCardState({this.frontPhoto, this.backPhoto});
}

class IDCardNotifier extends StateNotifier<IDCardState> {
  IDCardNotifier() : super(IDCardState());

  void setFrontPhoto(XFile photo) {
    state = IDCardState(frontPhoto: photo, backPhoto: state.backPhoto);
  }

  void setBackPhoto(XFile photo) {
    state = IDCardState(frontPhoto: state.frontPhoto, backPhoto: photo);
  }

  Future<void> uploadPhotoFromGallery(bool isFrontPhoto) async {
    final picker = ImagePicker();
    XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      if (isFrontPhoto) {
        setFrontPhoto(photo);
      } else {
        setBackPhoto(photo);
      }
    }
  }
}

