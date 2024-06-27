import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/providers/StoredID_provider.dart';
import 'package:kyc_mobile_app/app/providers/user_provider.dart';
import 'package:kyc_mobile_app/app/screens/Signup_screens/SignupTwo_screen.dart';
import 'package:kyc_mobile_app/app/widgets/buttons.dart';
import 'package:kyc_mobile_app/app/widgets/country_select_widget.dart';
import 'package:kyc_mobile_app/app/widgets/date_of_birth_field_widget.dart';
import 'package:kyc_mobile_app/app/widgets/my_app_bar.dart';
import 'package:kyc_mobile_app/utils/input_decoration.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';
import 'package:mongo_dart/mongo_dart.dart';

class SignUpOneScreen extends ConsumerWidget {
  const SignUpOneScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    // Calculate proportionate width and height
    double screenWidth = getProportionateScreenWidth(375);
    double screenHeight = getProportionateScreenHeight(812);

    // Accessing the sign-up data state
    final signUpData = ref.watch(signUpDataProvider);

    // Accessing the sign-up service
    final signUpService = ref.read(signUpProvider);

    return Scaffold(
      appBar: appBarWidget(context),
      body: SingleChildScrollView(
        child: Padding(
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
                  "About you",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Repository.headerColor(context),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(16)),
                Text(
                  "Please enter your full name as it appears on your ID or Passport.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Repository.subTextColor(context),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(18)),
                Text(
                  "Email Address",
                  style: TextStyle(
                    fontSize: 15,
                    color: Repository.subTextColor(context),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(7)),
                TextFormField(
                  decoration: inputDecoration(
                    text: "Enter your email",
                    prefixIcon: Icons.email,
                    context: context,
                  ),
                  onChanged: (value) {
                    ref.read(signUpDataProvider).email = value;
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(6)),

                Text(
                  "First Name",
                  style: TextStyle(
                    fontSize: 15,
                    color: Repository.subTextColor(context),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(7)),
                TextFormField(
                  decoration: inputDecoration(
                    text: "Enter your first name",
                    prefixIcon: Icons.person,
                    context: context,
                  ),
                  onChanged: (value) {
                    ref.read(signUpDataProvider).firstName = value;
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(6)),

                Text(
                  "Last Name",
                  style: TextStyle(
                    fontSize: 15,
                    color: Repository.subTextColor(context),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(3)),
                TextFormField(
                  decoration: inputDecoration(
                    text: "Enter your last name",
                    prefixIcon: Icons.groups,
                    context: context,
                  ),
                  onChanged: (value) {
                    ref.read(signUpDataProvider).lastName = value;
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(3)),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 15,
                    color: Repository.subTextColor(context),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(3)),
                TextFormField(
                  decoration: inputDecoration(
                    text: "Enter your password",
                    prefixIcon: Icons.lock,
                    context: context,
                  ),
                  onChanged: (value) {
                    ref.read(signUpDataProvider).password = value;
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(6)),

                Text(
                  "Select your birthdate",
                  style: TextStyle(
                    fontSize: 15,
                    color: Repository.subTextColor(context),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(16)),
                // Integrate the DateOfBirthField widget here
                const DateOfBirthField(),
                SizedBox(height: getProportionateScreenHeight(8)),

                Text(
                  "Country",
                  style: TextStyle(
                    fontSize: 15,
                    color: Repository.subTextColor(context),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                // Integrate the CountrySelectWidget here
                CountrySelectWidget(
                  onCountrySelected: (selectedCountry) {
                    ref.read(signUpDataProvider).country = selectedCountry;
                  },
                ),

                SizedBox(height: getProportionateScreenHeight(20)),
                SizedBox(
                  width: double.infinity,
                  height: getProportionateScreenHeight(56),
                  child: primaryButton(
                    context: context,
                    callback: () async {
                      // Call the signUp method from the signUpService and get the ID
                      ObjectId id = await signUpService.signUp(signUpData);

                      // Store the ID in the idProvider
                      ref.read(idProvider.notifier).state = id;
                      // Print the ID
                      //print('New user ID: ${id.oid}');
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const SignUpTwoScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    text: "Next",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
