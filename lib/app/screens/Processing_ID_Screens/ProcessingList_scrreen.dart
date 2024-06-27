import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kyc_mobile_app/app/providers/processinglist_provider.dart';
import 'package:kyc_mobile_app/app/screens/Processing_ID_Screens/ProcessingSucceeded_screen.dart';
import 'package:kyc_mobile_app/app/screens/Processing_ID_Screens/processingFailedScreen.dart';
import 'package:kyc_mobile_app/app/services/FalsifiedDocuments_Services.dart';
import 'package:kyc_mobile_app/app/widgets/Custom_notification.dart';
import 'package:kyc_mobile_app/app/widgets/my_app_bar.dart';
import 'package:kyc_mobile_app/utils/repository.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class ProcessingListScreen extends ConsumerStatefulWidget {
  final XFile photo;
  final int type;

  const ProcessingListScreen(
      {super.key, required this.photo, required this.type});

  @override
  ProcessingListScreenState createState() => ProcessingListScreenState();
}

class ProcessingListScreenState extends ConsumerState<ProcessingListScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final ImageProcessingService _imageProcessingService =
      ImageProcessingService(); // Instantiate ImageProcessingService

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();

    // Delay for 5 seconds and then check conditions and redirect
    Future.delayed(const Duration(seconds: 5), () async {
      if (!mounted) return;
      try {
        // Image processing logic
        var result = await _imageProcessingService.processImage(
            widget.photo.path, widget.type);
        if (result['falsified'] == true) {
          // Redirect to ProcessingFailedScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ProcessingSucceededScreen(
                falsified: false,

              ),
            ),
          );
        } else {
          // Redirect to ProcessingSucceededScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  ProcessingFailedScreen(
                falsified: true,
                errorMSG: result['errorMSG'],
              ),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to process image: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final conditions = ref.watch(processingListProvider);

    return Scaffold(
      appBar: appBarWidget(context),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(12)),
                    Text(
                      "Processing\nyour ID:",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Repository.headerColor(context),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(24)),
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: conditions.map((condition) {
                            final index = conditions.indexOf(condition);
                            if (index >
                                (_animation.value * conditions.length)
                                    .toInt()) {
                              return const SizedBox();
                            }
                            return Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Repository.iconColor(context),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(10),
                                    ),
                                    Expanded(
                                      child: Text(
                                        condition.condition,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Repository.iconColor(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Add space of height 9 between each condition
                                if (index < conditions.length - 1)
                                  const SizedBox(height: 9),
                              ],
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 100), // Adding fixed space below text
              ],
            ),
            Positioned(
              left: 10,
              bottom: 50,
              child: CustomNotification(
                text: "Processing your ID will take a few seconds",
                icon: Icons.help_outline,
                onTap: () {
                  // Add your onTap logic here if needed
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
