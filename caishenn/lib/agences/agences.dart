import 'package:caishenn/agences/map.dart';
import 'package:flutter/material.dart';

import '../services/agence_service.dart';



class agences extends StatefulWidget {
   List<dynamic> ag ;
   agences({super.key, required this.ag});

  @override
  State<agences> createState() => _agencesState();
}

@override


class _agencesState extends State<agences> {
  @override
  Widget build(BuildContext context) {
    final  height = MediaQuery.of(context).size.height;
    final  width = MediaQuery.of(context).size.width; 
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: map(ag: widget.ag,),
        ),
      ),
    );
  }
   Future<List<dynamic>>  _readagencies () async {
    var ag = await AgenceService.getAllAgencies();
    print(ag);
    return ag;   
  }
}
