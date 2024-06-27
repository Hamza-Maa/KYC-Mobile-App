import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define the state provider for password visibility
final passwordVisibilityProvider = StateProvider<bool>((ref) {
  return false; // Initial state: password is hidden
});
