import 'package:flutter/material.dart';
import 'package:kyc_mobile_app/utils/repository.dart';

class LiveTestAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String leftText;
  final String rightText;
  final VoidCallback? onLeftPressed;

  const LiveTestAppBarWidget({
    super.key,
    required this.leftText,
    required this.rightText,
    this.onLeftPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false, // Remove the back arrow
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: onLeftPressed,
            child: Text(
              leftText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            rightText,
            style: TextStyle(
              color: Repository.buttonColor(context),
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
