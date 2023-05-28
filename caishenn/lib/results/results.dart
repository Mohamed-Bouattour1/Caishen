
import 'dart:io';
import 'dart:typed_data';
import 'package:caishenn/results/viewpdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:caishenn/models/simulation.dart';
import 'package:caishenn/services/simulation_service.dart';
import 'package:flutter/material.dart';
import '../models/token.dart';
import '../tools/Colors.dart';
import '../tools/loadingScreen.dart';
import '../tools/newclip.dart';

class results extends StatefulWidget {
  final simulation sim;
  Token? token;

   results({super.key, required this.sim, this.token });

  @override
  State<results> createState() => _resultsState();
}

class _resultsState extends State<results> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //var isvisible = false;
    late File file;
    return 
    _isLoading ?
    
    loading_screen(height: size.height, width: size.width,)
  
:
    Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
          ClipPath(
            clipper: newclip(),
            child: Container(
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                color: bleufonce
                /* gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                ), */
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 9,
            left: MediaQuery.of(context).size.width / 3,
            child: Text(
              "Résultats",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
         Positioned(
          top: size.height/3.5,
          child: SizedBox(
            width: size.width,
            child: Center(
              child: Wrap(
              spacing: 20,
              runSpacing: 20,
                children: [
                  Container(
                    height: size.height*0.15,
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      color: bleuclaire1,
                      borderRadius:BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(10)), 
                      boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                  ),
                                ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Montant Crédit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: rose,
                        ),
                        ),
                        Text("${widget.sim.mnt_crd}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: bleufonce,
                        ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height*0.15,
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      color: bleuclaire1,
                      borderRadius:BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(10)), 
                      boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                  ),
                                ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Durée",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: rose,
                        ),
                        ),
                        Text("${widget.sim.duree_rnb}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: bleufonce,
                        ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height*0.15,
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      color: bleuclaire1,
                      borderRadius:BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(10)), 
                      boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                  ),
                                ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Taux appliqué",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: rose,
                        ),
                        ),
                        Text("${widget.sim.taux_app!*100}%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: bleufonce,
                        ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height*0.15,
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      color: bleuclaire1,
                      borderRadius:BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(10)), 
                      boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                  ),
                                ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Montant\néchéance ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: rose,
                        ),
                        ),
                        Text("${widget.sim.mnt_rnb}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: bleufonce,
                        ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height*0.15,
                    width: (size.width*0.8)+20,
                    decoration: BoxDecoration(
                      color: bleuclaire1,
                      borderRadius:BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)), 
                      boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                  ),
                                ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Total remboursement",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: rose,
                        ),
                        ),
                        Text("${widget.sim.montant_rnb_total}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: bleufonce,
                        ),
                        )
                      ],
                    ),
                  ),
                  
                      
                ],
              ),
            ),
          ),
          
          ),
          Positioned(
            top: size.height*0.85,
            
            child: Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async{
                      late String  dir;
                      if (Platform.isAndroid) {
                         //dir = (await getExternalStorageDirectory())!.path;
                         dir = "/storage/emulated/0/Download";
                      }else{
                         dir = (await getApplicationDocumentsDirectory()).path;
                      }
                      print("directory");
                      print(dir);
                      final String path = '$dir/simulation.pdf';
                      file = File(path);
                      await file.writeAsBytes(await getpdf());

                      setState(() {
                        Navigator.push(
                context, MaterialPageRoute(builder: (_) => pdfview(file: file,)));
          
                        //isvisible = true;
                      });
                      /* Navigator.push(context,
                    MaterialPageRoute(builder: (_) => fonc())); */
                    },
                    child: Container(
                      width: size.width*0.6,
                      height: size.height*0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: jaune,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Voir PDF",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                          Icon(Icons.download_sharp,color: Colors.white,size: 32,),
                          //if (isvisible) SfPdfViewer.memory(file.readAsBytesSync())
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

 getpdf() async{
  try {
    if (widget.token != null) {
      return await simulationService.getpdf(widget.token!, widget.sim.id_sim!);
    } else {
       return await simulationService.getpdfinv(widget.sim.id_sim!);
    }
  } catch (e) {
    print("error");
  }
}

}