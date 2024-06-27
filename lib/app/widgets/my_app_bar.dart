import 'package:flutter/material.dart';
import 'package:kyc_mobile_app/utils/repository.dart';

PreferredSizeWidget? appBarWidget(BuildContext context,
    {Color? backgroundColor, Color? arrowColor}) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      // Use the provided arrow color or fallback to the repository's color
      color: arrowColor ?? Repository.arrowColor(context),
      onPressed: () {
        // Handle navigation back to the previous screen
        Navigator.pop(context);
      },
    ),
    elevation: 0,
    backgroundColor:
        backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
    // Use provided background color or default to the theme's AppBar color
  );
}
