import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/providers/Login_provider.dart';
import 'package:kyc_mobile_app/app/providers/password_visibility_provider.dart';
import 'package:kyc_mobile_app/app/screens/Login_Screens/ForgetPassword_screen.dart';
import 'package:kyc_mobile_app/app/screens/Progress_screen.dart';
import 'package:kyc_mobile_app/app/screens/home_screen.dart';
import 'package:kyc_mobile_app/app/widgets/buttons.dart';
import 'package:kyc_mobile_app/utils/input_decoration.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});



  // TextEditingController for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    // Calculate proportionate width and height
    double screenWidth = getProportionateScreenWidth(375);
    double screenHeight = getProportionateScreenHeight(812);

    // Access the password visibility state using the provider
    final isPasswordVisible = ref.watch(passwordVisibilityProvider);

    // Access the login service provider
    final loginService = ref.read(loginProvider);



    return Scaffold(
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView to allow scrolling
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getProportionateScreenHeight(80)),
                Text(
                  "Sign into your Account",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Repository.headerColor(context),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(16)),
                Text(
                  "Log into your account",
                  style: TextStyle(
                    fontSize: 15,
                    color: Repository.subTextColor(context),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(23)),
                Text(
                  "Email Address",
                  style: TextStyle(
                    fontSize: 15,
                    color: Repository.subTextColor(context),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                TextFormField(
                  controller: emailController,
                  decoration: inputDecoration(
                    text: "Enter your email",
                    prefixIcon: Icons.email,
                    context: context,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(15)),
                Text(
                  "Password",
                  style: TextStyle(
                    color: Repository.subTextColor(context),
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                TextFormField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible, // Set the visibility based on the state
                  decoration: inputDecoration(
                    text: "Enter your password",
                    prefixIcon: Icons.lock,
                    suffixIcon: IconButton(
                      // Use the eye icon based on the password visibility state
                      icon: Icon(
                        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Repository.iconColor(context), // Set the color to match the prefix icon
                      ),
                      onPressed: () {
                        // Toggle the password visibility state
                        ref.read(passwordVisibilityProvider.notifier).state = !isPasswordVisible;
                      },
                    ),
                    context: context,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Text(
                  "Have you forgotten your password?",
                  style: TextStyle(
                    fontSize: 15,
                    color: Repository.subTextColor(context),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                GestureDetector(
                  onTap: () {
                    // Navigate to ForgetPasswordScreen with smooth transition
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => const ForgetPasswordScreen(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Click here to recover it",
                    style: TextStyle(
                      fontSize: 15,
                      color: Repository.textColor(context),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(175)),
                SizedBox(
                  width: getProportionateScreenWidth(335),
                  height: getProportionateScreenHeight(56),
                  child: primaryButton(
                    context: context,
                    callback: () async {
                      final email = emailController.text.trim();
                      final password = passwordController.text;

                      // Call the login method from the login service
                      final user = await loginService.login(email, password);

                      if (user != null) {
                        // Navigate to home screen if login successful
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                        );
                      } else {
                        // Show error message if login fails
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("Failed to connect. Please try again."),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    text: "Sign in",
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do you not have an account? ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Repository.subTextColor(context),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to SignupScreen with smooth transition
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => const SignupScreen(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Sign up here",
                        style: TextStyle(
                          fontSize: 15,
                          color: Repository.textColor(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
