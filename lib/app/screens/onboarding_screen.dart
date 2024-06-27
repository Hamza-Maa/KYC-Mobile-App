import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/providers/onboarding_provider.dart';
import 'package:kyc_mobile_app/app/widgets/buttons.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends ConsumerWidget {
  final VoidCallback onFinish;

  const OnboardingView({super.key, required this.onFinish});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);
    final controller = ref.watch(onboardingProvider);
    final pageController = PageController();

    return Scaffold(
      body: Container(
        width: getProportionateScreenWidth(375),
        height: getProportionateScreenHeight(812),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: PageView.builder(
          onPageChanged: (index) {
            controller.setLastPage(index == controller.items.length - 1);
          },
          itemCount: controller.items.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return _buildPage(context, controller, pageController, index);
          },
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, OnboardingItems controller, PageController pageController, int index) {
    double imageX = 20;
    double imageY = index == 0 ? 100 : index == 1 ? 100 : 80;
    double spaceBetweenImageAndIndicator = index == 0 ? 80 : index == 1 ? 30 : 36; // Update the space between image and indicator for the third screen
    double spaceBetweenIndicatorAndTitle =index == 0 ? 36: index == 1 ? 36 : 36;
    double spaceBetweenTitleAndDescription = index == 0 ? 10 : index == 1 ? 10 : 10;
    double spaceBetweenDescriptionAndButton = 20;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 335,
          height: controller.imageHeights[index],
          margin: EdgeInsets.only(top: getProportionateScreenHeight(imageY), left: getProportionateScreenWidth(imageX)),
          child: Image.asset(
            controller.items[index].image,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(spaceBetweenImageAndIndicator)),
        SmoothPageIndicator(
          controller: pageController,
          count: controller.items.length,
          onDotClicked: (index) => pageController.animateToPage(index,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeIn),
          effect: const ExpandingDotsEffect(
            dotHeight: 12,
            dotWidth: 12,
            activeDotColor: Colors.red,
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(spaceBetweenIndicatorAndTitle)),
        Text(
          controller.items[index].title,
          style: const TextStyle(color: Colors.black, fontSize: 26),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: getProportionateScreenHeight(spaceBetweenTitleAndDescription)),
        Text(
          controller.items[index].descriptions,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: getProportionateScreenHeight(spaceBetweenDescriptionAndButton)),
        primaryButton(
          context: context,
          callback: () {
            if (index == controller.items.length - 1) {
              onFinish(); // Callback to handle completion
            } else {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn);
            }
          },
          text: index == controller.items.length - 1 ? "Let's Go" : 'Next',
        ),
      ],
    );
  }
}
