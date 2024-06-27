import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyc_mobile_app/app/providers/livenesstest_provider.dart';
import 'package:kyc_mobile_app/app/screens/LiveTest_Screens/LiveTestSucceeded_Screen.dart';
import 'package:m7_livelyness_detection/index.dart';


class LiveTestScreen_V2 extends ConsumerStatefulWidget {
  const LiveTestScreen_V2({super.key});

  @override
  ConsumerState<LiveTestScreen_V2> createState() => _M7ScreenState();
}

class _M7ScreenState extends ConsumerState<LiveTestScreen_V2> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isLoading = true;
      });
      ref.read(livenessProvider).startLivenessDetection(context, _onLivenessComplete);
    });
  }

  void _onLivenessComplete() {
    setState(() {
      _isLoading = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  const LiveTestSucceededScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? const Center(
        child: CircularProgressIndicator.adaptive(),
      ) : _buildContent(),
    );
  }

  Widget _buildContent() {
    return const Center(
      child: Text(
        "Liveness Detection In Progress...",
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

