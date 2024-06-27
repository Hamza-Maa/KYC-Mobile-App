import 'dart:convert';
import 'package:http/http.dart' as http;

class LiveTestServices {
  static const String baseUrl = 'http://192.168.1.13:5000'; // Update with your Flask server IP address

  Future<String> captureRoute() async {
    final response = await http.get(Uri.parse(baseUrl));
    return _handleResponse(response);
  }

  Future<String> maskRoute() async {
    final response = await http.get(Uri.parse('$baseUrl/mask'));
    return _handleResponse(response);
  }

  Future<String> blinkRoute() async {
    final response = await http.get(Uri.parse('$baseUrl/blink'));
    return _handleResponse(response);
  }

  Future<String> headposeRoute() async {
    final response = await http.get(Uri.parse('$baseUrl/headpose'));
    return _handleResponse(response);
  }

  Future<String> fingercounterRoute() async {
    final response = await http.get(Uri.parse('$baseUrl/fingercounter'));
    return _handleResponse(response);
  }

  Future<String> deepfakedetectionRoute() async {
    final response = await http.get(Uri.parse('$baseUrl/deepfakedetection'));
    return _handleResponse(response);
  }

  String _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['message'];
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }
}
