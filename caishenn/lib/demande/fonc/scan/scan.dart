import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DocumentScanner extends StatefulWidget {
  @override
  _DocumentScannerState createState() => _DocumentScannerState();
}

class _DocumentScannerState extends State<DocumentScanner> {
   File? _image;
  

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    if (pickedFile == null) return;
    setState(() => _image = File(pickedFile.path));
  }

  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
            onPressed: () => _getImage(ImageSource.camera),
              child: Text('Scan Document'),),
            SizedBox(height: 20),
            if (_image != null) SizedBox(
              height: size.height*0.5,
              width: size.width*0.5,
              child: Image.file(_image!)
              ),
          ],
        ),
      ),
    );
  }
}