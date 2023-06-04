import 'dart:io';

import 'package:caishenn/home/languages/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/token.dart';
import '../../../tools/Colors.dart';
import '../valider_doc.dart';

class DocumentScanner extends StatefulWidget {
  List<dynamic> titres;
  Token token;
  String titre;
  DocumentScanner({super.key , required this.token, required this.titre, required this.titres});
  @override
  _DocumentScannerState createState() => _DocumentScannerState();
}

class _DocumentScannerState extends State<DocumentScanner> {
   File? _image;
   bool isvisible = false;
  

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    if (pickedFile == null) return;
    setState(()  {
      _image = File(pickedFile.path);
      this.isvisible = true;
      });
  }

  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).documentScanner),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        rose,
                      ),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(186, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ))),
            onPressed: () => _getImage(ImageSource.camera),
              child: Text(translation(context).scannerUnDocument),),
            SizedBox(height: 20),
            if (_image != null) SizedBox(
              height: size.height*0.5,
              width: size.width*0.5,
              child: Image.file(_image!)
              ),
              Visibility(
              visible: this.isvisible,
               child: GestureDetector(
                onTap: () async{
                  valider_doc( context, _image!, widget.token, widget.titre, widget.titres);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: MediaQuery.of(context).size.height*0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: rose,
                  ),
                  child: Center(
                    child: Text(
                      translation(context).valider,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                         ),
             ),
          ],
        ),
      ),
    );
  }
}