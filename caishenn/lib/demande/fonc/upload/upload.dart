import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../../../models/token.dart';
import '../../../tools/Colors.dart';
import '../valider_doc.dart';

class upload extends StatefulWidget {
  List<dynamic> titres;
  Token token;
  String titre;
  upload({super.key , required this.token, required this.titre, required this.titres});
  @override
  _uploadState createState() => _uploadState();
}

class _uploadState extends State<upload> {
  File? file;
bool isvisible = false;
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
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
              onPressed: _openFileExplorer,
              child: Text('Upload'),
            ),
            SizedBox(height: 20),
           // if (file != null) Image.file(file!),
            SizedBox(height: 20),
             Visibility(
              visible: this.isvisible,
               child: GestureDetector(
                onTap: () async{
                  await valider_doc( context, file!, widget.token, widget.titre, widget.titres);
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
                      "Valider",
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
  void _openFileExplorer() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    final file = File(result.files.single.path!);
    setState(
      ()  {
        this.file = file;
        this.isvisible = true;
      }
      );
  }
}