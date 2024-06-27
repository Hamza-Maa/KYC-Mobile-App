import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m7_livelyness_detection/index.dart';

final livenessProvider = Provider<LivenessProvider>((ref) {
  return LivenessProvider();
});

class LivenessProvider {
  final List<M7LivelynessStepItem> _verificationSteps = [
    M7LivelynessStepItem(
      step: M7LivelynessStep.smile,
      title: "Smile",
      isCompleted: false,
    ),
    M7LivelynessStepItem(
      step: M7LivelynessStep.blink,
      title: "Blink",
      isCompleted: false,
    ),
    M7LivelynessStepItem(
      step: M7LivelynessStep.turnLeft,
      title: "Turn Left",
      isCompleted: false,
    ),
  ];

  void startLivenessDetection(BuildContext context, VoidCallback onComplete) async {
    final String? response = await M7LivelynessDetection.instance.detectLivelyness(
      context,
      config: M7DetectionConfig(
        steps: _verificationSteps,
        startWithInfoScreen: false,
        maxSecToDetect: 60,
        allowAfterMaxSec: false,
        captureButtonColor: Colors.red,
      ),
    );
    if (response == null) {
      return;
    }
    onComplete();
  }
}
