import 'package:flutter/material.dart';

class LiveTestCaptureWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const LiveTestCaptureWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 72,
        height: 72,
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: Color(0xFFCDCDCD),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
