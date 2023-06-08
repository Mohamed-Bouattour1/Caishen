import 'package:caishenn/demande/Form_page.dart';
import 'package:caishenn/models/token.dart';
import 'package:flutter/material.dart';
import '../tools/Colors.dart';
import '../tools/appbarclip.dart';

class demande extends StatefulWidget {
  final Token token;
   demande({super.key ,required this.token });

  @override
  State<demande> createState() => _demandeState();
}

class _demandeState extends State<demande> {
  /*  List<Color> tabcolors = [
      bleufonce,
      bleuclaire1,
    ]; */
  int index = 0;
  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        title: Text("Demande"),
        backgroundColor: bleufonce,
        shape: CustomAppBarShape(multi: 0.05),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: gradient,begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,)
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /* SizedBox(
                height: MediaQuery.of(context).size.height / 4.4,
                width: double.infinity,
                child: Stack(children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: bleufonce,
                    ),
                  ),
                  /* ClipPath(
                   clipper: Clippcontainer(),
                   child: */
                  Container(
                    height: MediaQuery.of(context).size.height / 4.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                  ),
                  //),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 8,
                    left: MediaQuery.of(context).size.width / 8,
                    child: Text(
                      "Simulation Crédit à Remboursement Constant",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ), */ Form_page(token: widget.token) ,
            ],
          ),
        ),
      ),
    );
  }
}
