import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step {
  final String title;
  final String description;
  bool isComplete;
  bool isFailed;

  Step({
    required this.title,
    required this.description,
    this.isComplete = false,
    this.isFailed = false,
  });

  void toggle() {
    isComplete = !isComplete;
  }

  void fail() {
    isFailed = !isFailed;
  }
}

final stepProvider =
    StateNotifierProvider<StepNotifier, List<Step>>((ref) => StepNotifier());

class StepNotifier extends StateNotifier<List<Step>> {
  StepNotifier()
      : super([
          // Initialize with three steps, each with a title and description
          Step(title: 'Detection of falsified documents',
              description: 'identifying and verifying the\nauthenticity of your ID.'),
          Step(title: 'Live test Detection',
              description: 'verifying the authenticity of a person\nin real-time.'),
          Step(title: 'Deep fake Detection',
              description: 'Verifing the authenticity of the image.'),
        ]);

  void toggleStep(int index) {
    state[index].toggle();
    state = List.from(state); // Trigger state update
  }

  void toggleFailure(int index) {
    state[index].fail(); // Toggle failure state of the step
    state = List.from(state); // Trigger state update
  }
}
