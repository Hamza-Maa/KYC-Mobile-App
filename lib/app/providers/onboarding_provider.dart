import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/models/onboarding_model.dart';
import 'package:kyc_mobile_app/gen/assets.gen.dart';


class OnboardingItems {
  List<OnboardingModel> items;
  bool isLastPage;

// Add image heights for each item
  List<double> imageHeights = [248.53, 298, 311];
  OnboardingItems({required this.items, this.isLastPage = false});

  void setLastPage(bool value) {
    isLastPage = value;
  }
}

final onboardingProvider = StateProvider<OnboardingItems>((ref) {
  return OnboardingItems(items: [
    OnboardingModel(
      title: "Track your             "
          "Transactions",
      descriptions:
          "Integrate different methoods to help you up the track your transactions. ",
      //"that impress him as though they were fairy tales.",
      image:  Assets.gifs.onbroadingOne.path,
    ),
    OnboardingModel(
      title: "The most Secure Platfrom "
          " for Customer",
      descriptions: "Face recognition and more, keeping you completely safe ",
      // "from changing your life in an instant.",
      image:  Assets.gifs.onbroadingTwo.path,
    ),
    OnboardingModel(
      title: "Easy and                 "
          " Convenient",
      descriptions:
          "Streamline your banking experience with our easy and convenient app",
      image: Assets.gifs.onbroadingThree.path,
    ),

    // Add more OnboardingModel items here
  ]);
});
