import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  String _serverResponse = '';
  int _selectedType = 0; // Default type is 0

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future processImage() async {
    if (_image == null) {
      setState(() {
        _serverResponse = 'Please select an image first';
      });
      return;
    }

    var uploadRequest = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.1.13:5000/upload'),
    );

    uploadRequest.files
        .add(await http.MultipartFile.fromPath('file', _image!.path));

    var uploadResponse = await uploadRequest.send();

    if (uploadResponse.statusCode == 200) {
      var responseData = await uploadResponse.stream.bytesToString();
      var responseJson = jsonDecode(responseData);
      var fileUrl = responseJson['file_path'];

      var processRequest = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.1.13:5000/process'),
      );

      processRequest.fields['file_path'] = fileUrl;
      processRequest.fields['type'] =
          _selectedType.toString(); // Include selected type

      var processResponse = await processRequest.send();

      if (processResponse.statusCode == 200) {
        var processResult = await processResponse.stream.bytesToString();
        var resultJson = jsonDecode(processResult);
        setState(() {
          _serverResponse =
              'Falsified: ${resultJson['falsified']}, Error Message: ${resultJson['errorMSG']}';
        });
      } else {
        setState(() {
          _serverResponse = 'Error: ${processResponse.reasonPhrase}';
        });
      }
    } else {
      setState(() {
        _serverResponse = 'Error: ${uploadResponse.reasonPhrase}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Upload and Process'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: _image == null
                ? const Text('No image selected.')
                : Image.file(
                    _image!,
                    height: 300,
                  ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: getImage,
            child: const Text('Select Image'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedType = 0;
                  });
                },
                child: const Text('Type 0'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedType = 1;
                  });
                },
                child: const Text('Type 1'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: processImage,
            child: const Text('Process Image'),
          ),
          const SizedBox(height: 20),
          Text(_serverResponse),
        ],
      ),
    );
  }
}
