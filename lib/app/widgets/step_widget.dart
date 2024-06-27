import 'package:flutter/material.dart';
import 'package:kyc_mobile_app/utils/repository.dart';

class StepIndicator extends StatelessWidget {
  final bool isComplete;
  final bool isFailed; // Add new parameter
  final String title;
  final String description;
  final bool isLastStep;

  const StepIndicator({
    super.key,
    required this.isComplete,
    required this.isFailed, // Include new parameter in the constructor
    required this.title,
    required this.description,
    this.isLastStep = false,
  });

  @override
  Widget build(BuildContext context) {
    // Determine colors based on completion and failure state
    final dotColor = isFailed
        ? Repository.errorColor(context)
        : isComplete
            ? Repository.validColor(context)
            : Repository.stepColor(context);
    final lineColor = isFailed
        ? Repository.errorColor(context)
        : isComplete
            ? Repository.validColor(context)
            : Repository.stepColor(context);

    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Align the dot and text columns
      children: [
        Column(
          children: [
            // Step dot with icon based on completion and failure state
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: isFailed
                    ? const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 14,
                      )
                    : isComplete
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 14,
                          )
                        : Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
              ),
            ),
            // Add a line from the top if it's not the first step
            if (!isLastStep)
              Container(
                width: 2,
                height: 100,
                color: lineColor,
              ),
          ],
        ),
        const SizedBox(width: 16), // Add spacing between dot and text
        // Column to hold title and description
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to left side
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Repository.textColor(context)),
            ),
            Text(
              description,
              softWrap: true, // Enable soft wrap
              style: TextStyle(
                  fontSize: 16, color: Repository.subTextColor(context)),
            ),
          ],
        ),
      ],
    );
  }
}

// Buttons for failing and validating the first step
/*

Row(
children: [
ElevatedButton(
onPressed: () {
// Fail the first step using the provider
ref.read(stepProvider.notifier).toggleFailure(0);
},
child: const Text("Fail Step 1"),
),
const SizedBox(width: 8), // Add spacing between buttons
ElevatedButton(
onPressed: () {
// Validate the first step using the provider
ref.read(stepProvider.notifier).toggleComplete(0);
},
child: const Text("Valid Step 1"),
),
],
),

*/
