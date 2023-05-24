import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../tools/Colors.dart';
import '../services/send_call.dart';

class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  Widget build(BuildContext context) {
    
    final String mpsoft = "36.835699,10.2291889" ;
    final Uri gurl =Uri(
    scheme: 'https',
    host: 'comgooglemaps',
    path: '://',
    queryParameters: {'center': '$mpsoft'});
    final Uri aurl =Uri(
    scheme: 'https',
    host: 'maps.apple.com',
    path: '/',
    queryParameters: {'q': '$mpsoft'});
    //final String gurl = "comgooglemaps://?center=$mpsoft";   
    //final String aurl = "https://maps.apple.com/?q=$mpsoft"; 
    final  height = MediaQuery.of(context).size.height;
    final  width = MediaQuery.of(context).size.width;
    //final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        FlutterMap(
          //mapController: _mapController,
          options: MapOptions(
            center: LatLng(36.83563875901047, 10.229695495535411),
            zoom: 15.0,
            maxZoom: 19.0
          ),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
          ],
          nonRotatedChildren: [],
        ),
       GestureDetector(
                        onTap: () {
                          setState(() {
                            open_maps(gurl,aurl);
                          });
                        },
                        child: Container(
                          height: height*0.05,
                          width: width*0.55,
                          decoration: BoxDecoration(
                            border: Border.all(color: rose,),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text("Voir Toutes les Agences",
                      style: TextStyle(color: rose,fontSize: 15),),
                          ),
                        ),
                      ),
      ],
    );
  }
}
