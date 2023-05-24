
import 'package:flutter/material.dart';

class Clippcontainer extends CustomClipper<Path>{
@override
Path getClip(Size size) {
final path=Path();
path.lineTo(0.0, size.height*0.85);
var startpoints = Offset(0.0, size.height*0.90);
var startcontrolpoints = Offset(size.width/3.6, size.height*0.91);
path.quadraticBezierTo (startpoints.dx, startpoints.dy,startcontrolpoints.dx, startcontrolpoints.dy); 
var endpoints = Offset(size.width*0.7, size.height*0.85);
var endcontrolpoints = Offset(size.width, size.height);
path.quadraticBezierTo(endpoints.dx, endpoints.dy,endcontrolpoints.dx, endcontrolpoints.dy);
path.lineTo(size.width,0.0);
path.close();
return path;
}
@override
bool shouldReclip(CustomClipper<Path> oldClipper) {
return false;
}

}