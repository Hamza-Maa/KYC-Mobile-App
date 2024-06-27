import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageProcessingService {
  Future<String> uploadImage(String imagePath) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.1.13:5000/upload'),
    );
    request.files.add(await http.MultipartFile.fromPath('file', imagePath));
    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var responseJson = jsonDecode(responseData);
      return responseJson['file_path'];
    } else {
      throw Exception('Failed to upload image');
    }
  }

  Future<Map<String, dynamic>> processImage(String imagePath, int type) async {
    var fileUrl = await uploadImage(imagePath);

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.1.13:5000/process'),
    );
    request.fields['file_path'] = fileUrl;
    request.fields['type'] = type.toString();
    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      return jsonDecode(responseData);
    } else {
      throw Exception('Failed to process image');
    }
  }
}
