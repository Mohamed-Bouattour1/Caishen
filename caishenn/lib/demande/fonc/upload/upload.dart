import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class upload extends StatefulWidget {
  @override
  _uploadState createState() => _uploadState();
}

class _uploadState extends State<upload> {
  File? file;

  void _openFileExplorer() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    final file = File(result.files.single.path!);
    setState(() => this.file = file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _openFileExplorer,
              child: Text('Open file picker'),
            ),
            SizedBox(height: 20),
            if (file != null) Image.file(file!),
          ],
        ),
      ),
    );
  }
}