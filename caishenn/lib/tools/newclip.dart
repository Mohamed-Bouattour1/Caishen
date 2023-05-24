import 'dart:ui';

import 'package:flutter/cupertino.dart';

class newclip extends CustomClipper<Path>{
@override
Path getClip(Size size) {
final path=Path();
path.lineTo(0.0, size.height);
var startpoints = Offset(size.width*0.1, size.height-60.0);
var startcontrolpoints = Offset(size.width/2.32, size.height-50.0);
path.quadraticBezierTo (startpoints.dx, startpoints.dy,startcontrolpoints.dx, startcontrolpoints.dy); 
var endpoints = Offset(size.width/1.1, size.height-22);
var endcontrolpoints = Offset(size.width, size.height-75);
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