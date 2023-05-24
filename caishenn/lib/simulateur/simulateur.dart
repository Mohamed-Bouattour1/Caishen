import 'dart:convert';

import 'package:caishenn/models/simulation.dart';
import 'package:caishenn/models/token.dart';
import 'package:caishenn/simulateur/input_Field.dart';
import 'package:caishenn/tools/utilities.dart';
import 'package:flutter/material.dart';
import '../results/results.dart';
import '../services/simulation_service.dart';
import '../tools/Colors.dart';
import '../tools/newclip.dart';

class simulateur extends StatefulWidget {
  final Token? token;
  const simulateur({super.key, this.token});

  @override
  State<simulateur> createState() => _simulateurState();
}

class _simulateurState extends State<simulateur> {
  List<Color> colors = [bleufonce, bleuclaire1, bleuclaire1];
  List<int> flex = [2, 2, 2];
  List<int> type = [0, 1, 2];
  Color thm = jaune;
  int compteur = 0;
  TextEditingController _DureeController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _amountrnbController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.33,
                width: width,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      top: 0,
                      child: ClipPath(
                        clipper: newclip(),
                        child: Container(
                          height: height * 0.33,
                          width: width,
                          decoration: BoxDecoration(color: thm
                              /* gradient: LinearGradient(
                              colors: gradient,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
                            ), */
                              ),
                        ),
                      ),
                    ),
                    choix_type(width, height, true),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Input_Field(
                title:
                    thm == jaune ? "Montant Remboursement" : "Montant Crédit",
                hint: "0.0  ",
                controller:
                    thm == jaune ? _amountrnbController : _amountController,
                shape: 1,
                direction: 0,
                color: thm,
                keyboard: "num",
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Input_Field(
                title: thm == jaune
                    ? "Durée Remboursement"
                    : thm == rose1
                        ? "Montant Remboursement"
                        : "Durée Remboursement",
                hint: "0.0 ",
                controller: thm == jaune
                    ? _DureeController
                    : thm == rose1
                        ? _amountrnbController
                        : _DureeController,
                shape: 1,
                color: thm,
                keyboard: "num",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //_selectNature(),
                  GestureDetector(
                    onTap: () async {
                      _validateData();
                      /*  if (
        _amountrnbController.text.isNotEmpty &&
        _DureeController.text.isNotEmpty) {
      
        tosend.mnt_rnb=int.parse(_amountrnbController.text);
        tosend.duree_rnb=int.parse(_DureeController.text);
          print(await simulationService.simRequest(tosend));
      
    } else if (
        _amountrnbController.text.isEmpty ||
        _DureeController.text.isEmpty) {
          
      pop();
    } */
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: bleufonce,
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
                  /* SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const welcome()));
              },
              child: Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: jaune,
                ),
                child: Center(
                  child: Text(
                    "Annuler",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ), */
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container choix_type(double width, double height, bool scroll) {
    return Container(
      child: /* scroll
          ? */ SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    choix_n(height, width, type[0]),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    choix_n(height, width, type[1]),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    choix_n(height, width, type[2]),
                    SizedBox(
                      width: width * 0.1,
                    ),
                  ],
                ),
              ),
            )
          /* : Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: flex[0], child: choix_n(height, width, 0)),
                  Expanded(flex: flex[1], child: choix_n(height, width, 1)),
                  Expanded(flex: flex[2], child: choix_n(height, width, 2)),
                ],
              ),
            ), */
    );
  }

  GestureDetector choix_n(double height, double width, int i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          colors = [bleuclaire1, bleuclaire1, bleuclaire1];
          colors[i] = bleufonce;
          thm = i == 0
              ? jaune
              : i == 1
                  ? rose1
                  : bleuclaire2;
          /* flex = [2, 2, 2];
          flex[i] = 0;
          compteur++; */
        });
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: Stack(alignment: Alignment.center, children: [
            Positioned(
              top: (height * 0.25) * 0.18,
              child: Image.asset(
                i == 0
                    ? "assets/images/project-management_(2).png"
                    : i == 1
                        ? "assets/images/team-leader_(1).png"
                        : "assets/images/lego_(1).png",
                fit: BoxFit.scaleDown,
              ),
            ),
            Positioned(
                bottom: (height * 0.25) * 0.2,
                child: Text(
                  i == 0
                      ? "Montant Crédit"
                      : i == 1
                          ? "Durée Crédit"
                          : "Montant Remboursement",
                  style: TextStyle(
                      color: colors[i] == bleufonce ? bleuclaire1 : bleufonce,
                      fontWeight: FontWeight.bold),
                )),
          ]),
        ),
        height: height * 0.25,
        width: width * 0.45,
        decoration: BoxDecoration(
          color: colors[i],
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
        ),
      ),
    );
  }

  /* var mnt_rnb = int.parse(_amountrnbController.text);
        var duree_rnb = int.parse(_DureeController.text);
        var sendthis = {
  "duree_rnb": duree_rnb ,
  "mnt_rnb": duree_rnb
}; */
  _validateData() async {
    var tosend = simulation.fromJson({});
    if (thm == jaune) {
      _amountController.clear();
      if (_amountrnbController.text.isNotEmpty &&
          _DureeController.text.isNotEmpty) {
        tosend.mnt_rnb = double.parse(_amountrnbController.text);
        tosend.duree_rnb = int.parse(_DureeController.text);
        if (widget.token != null) {
          var res = await simulationService.simRequest(tosend , widget.token!);
          if (res == "error") {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackbar("erreur", "quelques choses ne va pas "));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => results(sim: simulation.fromJson(jsonDecode(res)))));
          }
        }
      } else if (_amountrnbController.text.isEmpty ||
          _DureeController.text.isEmpty) {
        pop();
      }
    } else if (thm == rose1) {
      _DureeController.clear();
      if (_amountController.text.isNotEmpty &&
          _amountrnbController.text.isNotEmpty) {
        tosend.mnt_crd = double.parse(_amountController.text);
        tosend.mnt_rnb = double.parse(_amountrnbController.text);
         if (widget.token != null) {
          var res = await simulationService.simRequest(tosend, widget.token!);
          if (res == "error") {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackbar("erreur", "quelques choses ne va pas "));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => results(sim: simulation.fromJson(jsonDecode(res)))));
          }
        }
      } else if (_amountController.text.isEmpty ||
          _amountrnbController.text.isEmpty) {
        pop();
      }
    } else if (thm == bleuclaire1) {
      print("bleuclaire");
      _amountrnbController.clear();
      if (_amountController.text.isNotEmpty &&
          _DureeController.text.isNotEmpty) {
        tosend.mnt_crd = double.parse(_amountController.text);
        tosend.duree_rnb = int.parse(_DureeController.text);
         if (widget.token != null) {
          var res = await simulationService.simRequest(tosend, widget.token!);
          if (res == "error") {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackbar("erreur", "quelques choses ne va pas "));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => results(sim: simulation.fromJson(jsonDecode(res)))));
          }
        }
      } else if (_amountController.text.isEmpty ||
          _DureeController.text.isEmpty) {
        pop();
      }
    }
  }

  Future<dynamic> pop() {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          "required",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        content: Text(
          "All fields are required !",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 24.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        backgroundColor: bleufonce,
      ),
      //barrierDismissible: false,
    );
  }
}
