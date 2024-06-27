import 'package:flutter/cupertino.dart';
import 'package:m7_livelyness_detection/index.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liveness Detection Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: M7ExpampleScreen(),
        ),
      ),
    );
  }
}

class M7ExpampleScreen extends StatefulWidget {
  const M7ExpampleScreen({super.key});

  @override
  State<M7ExpampleScreen> createState() => _M7ExpampleScreenState();
}

class _M7ExpampleScreenState extends State<M7ExpampleScreen> {
  //* MARK: - Private Variables
  //? =========================================================
  final bool _isLoading = false;
  bool _startWithInfo = false;
  bool _allowAfterTimeOut = false;
  final List<M7LivelynessStepItem> _veificationSteps = [];
  int _timeOutDuration = 60;

  //* MARK: - Life Cycle Methods
  //? =========================================================
  @override
  void initState() {
    _initValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _buildBody(),
    );
  }

  //* MARK: - Private Methods for Business Logic
  //? =========================================================
  void _initValues() {
    _veificationSteps.addAll(
      [
        M7LivelynessStepItem(
          step: M7LivelynessStep.smile,
          title: "Smile",
          isCompleted: false,
        ),
        M7LivelynessStepItem(
          step: M7LivelynessStep.blink,
          title: "Blink",
          isCompleted: false,
        ),
        M7LivelynessStepItem(
          step: M7LivelynessStep.turnLeft,
          title: "Turn Left",
          isCompleted: false,
        ),


      ],
    );
    M7LivelynessDetection.instance.configure(
      contourColor: Colors.white,
      thresholds: [
        M7SmileDetectionThreshold(
          probability: 0.8,
        ),
        M7BlinkDetectionThreshold(
          leftEyeProbability: 0.25,
          rightEyeProbability: 0.25,
        ),
        M7HeadTurnDetectionThreshold(rotationAngle: 45.0)
      ],
    );
  }

  void _onStartLivelyness() async {
    final String? response =
    await M7LivelynessDetection.instance.detectLivelyness(
      context,
      config: M7DetectionConfig(
        steps: _veificationSteps,
        startWithInfoScreen: _startWithInfo,
        maxSecToDetect: _timeOutDuration == 100 ? 2500 : _timeOutDuration,
        allowAfterMaxSec: _allowAfterTimeOut,
        captureButtonColor: Colors.red,
      ),
    );
    if (response == null) {
      return;
    }
  }

  //* MARK: - Private Methods for UI Components
  //? =========================================================


  Widget _buildBody() {
    return Stack(
      fit: StackFit.loose,
      children: [
        _buildContent(),
        Visibility(
          visible: _isLoading,
          child: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [

        Center(
          child: ElevatedButton(
            onPressed: _onStartLivelyness,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
            ),
            child: const Text(
              "Detect Livelyness",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}