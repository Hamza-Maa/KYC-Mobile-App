import 'package:flutter/material.dart';
import 'package:kyc_mobile_app/utils/repository.dart';

class CustomNotification extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onTap;

  const CustomNotification({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 335, // Width of the custom container
        height: 56, // Height of the custom container
        decoration: BoxDecoration(
          color: Repository.CustomnotificationColor(context), // Background color
          borderRadius: BorderRadius.circular(16), // Border radius
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Center the circle with icon
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Repository.circleiconColor(context), // Circle background color
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 16, // Icon size
                    color: Colors.black, // Icon color
                  ),
                ),
              ),
              const SizedBox(width: 8), // Spacing between circle and text
              // Text in the middle
              Text(
                text,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 14, // Adjust font size as needed
                  color: Colors.black, // Text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
