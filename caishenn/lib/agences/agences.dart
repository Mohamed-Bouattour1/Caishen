import 'package:caishenn/agences/map.dart';
import 'package:flutter/material.dart';



class agences extends StatefulWidget {
  const agences({super.key});

  @override
  State<agences> createState() => _agencesState();
}

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
          child: map(),
        ),
      ),
    );
  }
}
