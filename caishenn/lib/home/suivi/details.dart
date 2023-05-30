import 'package:caishenn/models/demande.dart';
import 'package:caishenn/tools/Colors.dart';
import 'package:flutter/material.dart';

class details extends StatefulWidget {
  demande dem;
   details({super.key, required this.dem});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
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
        color: Colors.white,
        child: Column(
      children: [
        wid("type",widget.dem.type.toString(),width,height),
        wid("montant",widget.dem.mnt_crd.toString(),width,height),
        wid("duree",widget.dem.duree_rnb.toString(),width,height),
        wid("date déblocage",widget.dem.datedeblecage.toString(),width,height),
        wid("date première échéance",widget.dem.datepremech.toString(),width,height),
        wid("date dépot",widget.dem.datedepot.toString(),width,height),
        wid("date réception",widget.dem.daterecep.toString(),width,height),
        wid("taux appliqué",widget.dem.taux_app.toString(),width,height),
      ],
    ),
      ),
    );

  }

  Row wid(String titre, String valeur, double width, double height)  
  {
   return Row(
    mainAxisAlignment: MainAxisAlignment.start,
     children: [
       Text(titre+" :",
       style: TextStyle(
        fontSize: 20,
        color: rose
       ),
       ),
       SizedBox(width:width*0.1 ,),
       Text(valeur,
       style: TextStyle(
        fontSize: 20,
        
       ),),
       SizedBox(height: height*0.1,)
     ],
   );
    }
}