import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/models/processinglist_model.dart';

class ProcessingListNotifier extends StateNotifier<List<ProcessingCondition>> {
  ProcessingListNotifier()
      : super([
    ProcessingCondition(condition: "Ensuring data matches.", isChecked: true),  // Set isChecked to true
    ProcessingCondition(condition: "Checking name validity.", isChecked: true),
    ProcessingCondition(condition: "Ensuring font validity.", isChecked: true),
    ProcessingCondition(condition: "Verifying the MRZ.", isChecked: true),
    ProcessingCondition(condition: "Confirming dates validity.", isChecked: true),
    ProcessingCondition(condition: "Checking if the country is supported by our algo.", isChecked: true),
    ProcessingCondition(condition: "Confirming the image type.", isChecked: true),
    ProcessingCondition(condition: "Ensuring acceptable image quality.", isChecked: true),
  ]);

  void checkCondition(int index) {
    state = [
      ...state.sublist(0, index),
      ProcessingCondition(condition: state[index].condition, isChecked: true),
      ...state.sublist(index + 1),
    ];
  }
}

final processingListProvider = StateNotifierProvider<ProcessingListNotifier, List<ProcessingCondition>>((ref) {
  return ProcessingListNotifier();
});
