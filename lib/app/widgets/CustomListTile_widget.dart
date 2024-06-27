import 'package:flutter/material.dart';
import 'package:kyc_mobile_app/utils/repository.dart';

class CustomListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onTap;

  const CustomListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 343, // Width of the list tile
        height: 64, // Height of the list tile
        decoration: BoxDecoration(
          color: Repository.customTileColor(context), // Background color
          borderRadius: BorderRadius.circular(22), // Border radius
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text widget on the left
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Set your desired text color
                ),
              ),
              // Icon widget on the right
              Icon(
                icon,
                color: Colors.black, // Set your desired icon color
                size: 18, // Adjust icon size if needed
              ),
            ],
          ),
        ),
      ),
    );
  }
}
