import 'dart:io';

import 'package:caishenn/models/agence.dart';
import 'package:caishenn/services/agence_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../tools/Colors.dart';
import '../services/send_call.dart';

class map extends StatefulWidget {
   List<dynamic> ag ;
   map({super.key, required this.ag});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  Widget build(BuildContext context) {
    
    /* final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width; */
    //final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        FlutterMap(
          //mapController: _mapController,
          options: MapOptions(
              center: LatLng(36.83563875901047, 10.229695495535411),
              zoom: 12.0,
              maxZoom: 19.0),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            MarkerLayer(
              markers: 
                List.generate(widget.ag.length, (index) => 
              agence(context, Agence.fromJson(widget.ag[index])),
              ),
                
            ),
          ],
          nonRotatedChildren: [],
        ),
        /*  GestureDetector(
          onTap: () {
            setState(() {
              open_maps(gurl, aurl);
            });
          },
          child: Container(
            height: height * 0.05,
            width: width * 0.55,
            decoration: BoxDecoration(
              border: Border.all(
                color: rose,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                "Voir Toutes les Agences",
                style: TextStyle(color: rose, fontSize: 15),
              ),
            ),
          ),
        ), */
      ],
    );
  }

  Marker agence(BuildContext context, Agence agence) {
    final Uri gurl = Uri(
        scheme: 'https',
        host: 'comgooglemaps',
        path: '://',
        queryParameters: {'center': agence.lat!+','+agence.long!});
    final Uri aurl = Uri(
        scheme: 'https',
        host: 'maps.apple.com',
        path: '/',
        queryParameters: {'q': agence.lat!+','+agence.long!});
    print(agence);
    return Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(double.parse(agence.lat!), double.parse(agence.long!)),
                builder: (ctx) => GestureDetector(
                  child: Container(
                    child: Icon(
                      Icons.location_on,
                      color: rose,
                      size: 50,
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                agence.nom!+'${agence.nom_imf!}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 8.0),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        open_maps(gurl, aurl);
                                      });
                                    },
                                    child: Text(
                                      agence.adresse!,
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                             /*  Row(
                                children: [
                                  Icon(Icons.access_time),
                                  SizedBox(width: 8.0),
                                  Text(
                                    Platform.isAndroid? "Ouvrir dans Google Maps" : "Ouvrir dans Apple Maps",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0), */
                              GestureDetector(
                                onTap: () {
                                  call(agence.tel!);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(width: 8.0),
                                    Text(
                                      agence.tel!,
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    SizedBox(width: 16.0),
                                    
                                  ],
                                ),
                              ),
                             
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              );
  }
   /* Future<List<dynamic>>  _readagencies () async {
    var ag = await AgenceService.getAllAgencies();
    print(ag);
    return ag;   
  } */
}
