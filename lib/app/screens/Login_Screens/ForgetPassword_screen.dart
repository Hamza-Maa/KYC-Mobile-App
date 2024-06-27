import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/providers/Forger_Password_provider.dart';
import 'package:kyc_mobile_app/app/screens/Login_Screens/RecoverPassword_screen.dart';
import 'package:kyc_mobile_app/app/widgets/buttons.dart';
import 'package:kyc_mobile_app/app/widgets/my_app_bar.dart';
import 'package:kyc_mobile_app/utils/input_decoration.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

final emailTextEditingControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

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
                "Forget Password?",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Repository.headerColor(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(24)),
              Text(
                "Please enter your email to recover your password.",
                style: TextStyle(
                  fontSize: 15,
                  color: Repository.subTextColor(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(45)),
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 15,
                  color: Repository.subTextColor(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
              Consumer(
                builder: (context, ref, _) {
                  final emailController =
                      ref.watch(emailTextEditingControllerProvider);
                  return TextFormField(
                    controller: emailController,
                    decoration: inputDecoration(
                      text: "Enter your email",
                      prefixIcon: Icons.email_outlined,
                      context: context,
                    ),
                  );
                },
              ),
              SizedBox(height: getProportionateScreenHeight(323)),
              SizedBox(
                width: double.infinity,
                height: getProportionateScreenHeight(56),
                child: Consumer(
                  builder: (context, ref, _) {
                    final email =
                        ref.watch(emailTextEditingControllerProvider).text;
                    return primaryButton(
                      context: context,
                      callback: () async {
                        try {
                          await ref.read(forgetPasswordProvider(email).future);
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      RecoverPasswordScreen(email: email),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
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
                      },
                      text: "Recover password",
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
