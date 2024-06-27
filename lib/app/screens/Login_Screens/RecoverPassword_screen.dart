import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/models/forgetPass_model.dart';
import 'package:kyc_mobile_app/app/providers/Forger_Password_provider.dart';
import 'package:kyc_mobile_app/app/screens/Login_Screens/login_screen.dart';
import 'package:kyc_mobile_app/app/widgets/buttons.dart';
import 'package:kyc_mobile_app/app/widgets/my_app_bar.dart';
import 'package:kyc_mobile_app/utils/input_decoration.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

final newPasswordTextEditingControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final confirmPasswordTextEditingControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());

class RecoverPasswordScreen extends StatelessWidget {
  final String email;

  const RecoverPasswordScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    // Calculate proportionate width and height
    double screenWidth = getProportionateScreenWidth(375);
    double screenHeight = getProportionateScreenHeight(812);

    return Scaffold(
      appBar: appBarWidget(context),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(12)),
              Text(
                "Recover Password",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Repository.headerColor(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(24)),
              Text(
                "Please enter your new password to continue",
                style: TextStyle(
                  fontSize: 15,
                  color: Repository.subTextColor(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(45)),
              Text(
                "New password",
                style: TextStyle(
                  fontSize: 15,
                  color: Repository.subTextColor(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
              Consumer(
                builder: (context, ref, _) {
                  final newPasswordController =
                      ref.watch(newPasswordTextEditingControllerProvider);
                  return TextFormField(
                    controller: newPasswordController,
                    decoration: inputDecoration(
                      text: "Enter your new password",
                      prefixIcon: Icons.lock,
                      context: context,
                    ),
                  );
                },
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                "Confirm password",
                style: TextStyle(
                  fontSize: 15,
                  color: Repository.subTextColor(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
              Consumer(
                builder: (context, ref, _) {
                  final confirmPasswordController =
                      ref.watch(confirmPasswordTextEditingControllerProvider);
                  return TextFormField(
                    controller: confirmPasswordController,
                    decoration: inputDecoration(
                      text: "Re-enter your password",
                      prefixIcon: Icons.lock,
                      context: context,
                    ),
                  );
                },
              ),
              SizedBox(height: getProportionateScreenHeight(245)),
              SizedBox(
                width: double.infinity,
                height: getProportionateScreenHeight(56),
                child: Consumer(
                  builder: (context, ref, _) {
                    final newPassword = ref
                        .watch(newPasswordTextEditingControllerProvider)
                        .text;
                    final confirmPassword = ref
                        .watch(confirmPasswordTextEditingControllerProvider)
                        .text;
                    final signUpData = PasswordModel(
                      email: email,
                      password: newPassword,
                    );
                    return primaryButton(
                      context: context,
                      callback: () async {
                        if (newPassword == confirmPassword) {
                          try {
                            await ref.read(
                                recoverPasswordProvider(signUpData).future);
                            // Password updated successfully
                            // You can navigate the user to a success screen
                            Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                        LoginScreen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                          } catch (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(error.toString()),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Passwords do not match"),
                            ),
                          );
                        }
                      },
                      text: "Change password",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
