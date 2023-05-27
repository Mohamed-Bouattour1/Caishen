import 'package:caishenn/demande/fonc/scan/scan.dart';
import 'package:caishenn/demande/fonc/upload/upload.dart';
import 'package:caishenn/models/simulation.dart';
import 'package:caishenn/models/token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../tools/Colors.dart';

class doc_card extends StatelessWidget {
   doc_card({
    super.key,
    required this.height,
    required this.width,
    required this.titre,
    required this.token,
    required this.titres
  });

  final double height;
  final double width;
  final String titre;
  final Token token;
  List<dynamic> titres;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: Container(
        height: height*0.1,
        width: width,
        color: bleuclaire1,
        child: Center(
          child: ListTile(
            leading: Icon(Icons.upload_file,color: rose,size: 30,),
            title: Text(
              titre,
              style: TextStyle(
                color: rose,
                fontSize: 13,
              ),
            ),
            trailing: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      endActionPane:  ActionPane(
    motion: BehindMotion(),
    children: [
      SlidableAction(
        // An action can be bigger than the others.
        onPressed: (context){
          Navigator.push(context,
                      MaterialPageRoute(builder: (_) => upload(token: token, titre: titre, titres: titres)));
        },
        backgroundColor: rose,
        foregroundColor: Colors.white,
        icon: Icons.upload,
        label: 'Uploader',
      ),
      SlidableAction(
        // An action can be bigger than the others.
        onPressed: (context){
          Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DocumentScanner(token: token, titre: titre, titres: titres)));
        },
        backgroundColor: jaune,
        foregroundColor: Colors.white,
        icon: Icons.camera_enhance,
        label: 'Scanner',
      ),
    ],
  ),
    );
  }
}
