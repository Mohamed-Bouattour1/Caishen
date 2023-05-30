import 'package:caishenn/demande/fonc/doc.dart';
import 'package:caishenn/demande/fonc/scan/scan.dart';
import 'package:caishenn/demande/fonc/upload/upload.dart';
import 'package:caishenn/models/token.dart';
import 'package:flutter/material.dart';

import '../../tools/Colors.dart';

class fonc extends StatefulWidget {
  List<dynamic> titres;
  Token token;
   fonc({super.key, required this.titres, required this.token});

  @override
  State<fonc> createState() => _foncState();
}

class _foncState extends State<fonc> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bleufonce,
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
              children: [
                  
                ListView.separated(
                  reverse: true,
                  shrinkWrap: true,
                itemBuilder: (context, i) {
                  return doc_card(height: height, width: width, titre: widget.titres[i], token: widget.token, titres: widget.titres,);
                },
                separatorBuilder: (context, i) {
                  return Container(
                    height: height * 0.01,
                  );
                },
                itemCount: widget.titres.length,
                  ),
              ],
            )
      ),
    );
  }
}