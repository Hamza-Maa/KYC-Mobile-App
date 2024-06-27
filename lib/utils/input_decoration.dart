import 'package:flutter/material.dart';
import 'package:kyc_mobile_app/utils/repository.dart';

InputDecoration inputDecoration({
  String? text,
  IconData? prefixIcon,
  Widget? suffixIcon,
  required BuildContext context,
}) {
  return InputDecoration(
    hintText: text,
    hintStyle: TextStyle(color: Repository.hintColor(context)),
    prefixIcon: prefixIcon == null
        ? null
        : Icon(
            prefixIcon,
            color: Repository.iconColor(context),
          ),
    suffixIcon: suffixIcon == null
        ? null
        : IconTheme(
            data: IconThemeData(
              color: Repository.iconColor(context),
            ),
            child: suffixIcon,
          ),
    filled: true,
    fillColor: Repository.fieldColor(context),
    contentPadding: const EdgeInsets.symmetric(
        vertical: 16, horizontal: 16), // Set padding to match height and width
    // Add the rounded border style
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none, // No visible border
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none, // No visible border
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none, // No visible border
    ),
  );
}
