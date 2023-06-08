import 'package:caishenn/demande/fonc/doc.dart';
import 'package:caishenn/home/home.dart';
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
        automaticallyImplyLeading: false,
        backgroundColor: bleufonce,
        leading: IconButton(
          icon:Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => home(
                                        token: widget.token,
                                      )));
          },
         ),
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