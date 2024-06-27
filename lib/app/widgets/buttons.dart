import 'package:flutter/material.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

Widget primaryButton(
    {required BuildContext context,
    required VoidCallback callback,
    required String text,
    Color? color}) {
  return SizedBox(
    width: 335,
    height: 56,
    //padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Repository.buttonColor(context),
            elevation: 0,
            //shadowColor: Colors.indigoAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            padding: const EdgeInsets.symmetric(vertical: 16)),
        onPressed: callback,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        )),
  );
}

Widget miniButton(
    {required BuildContext context,
    required VoidCallback callback,
    required String text,
    Color? color}) {
  return SizedBox(
    width: 167.5,
    height: 56,
    //padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Repository.buttonColor(context),
            elevation: 0,
            //shadowColor: Colors.indigoAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            padding: const EdgeInsets.symmetric(vertical: 16)),
        onPressed: callback,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        )),
  );
}

Widget outlinedButton(
    {required BuildContext context,
    required VoidCallback callback,
    required Widget child,
    String? color}) {
  return OutlinedButton(
    onPressed: callback,
    style: OutlinedButton.styleFrom(
      foregroundColor: Repository.buttonColor(context),
      backgroundColor: Colors.transparent,
      elevation: 0,
      side: const BorderSide(color: Colors.white, width: 1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))),
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
    ),
    child: child,
  );
}
