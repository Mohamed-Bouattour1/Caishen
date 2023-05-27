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
    final String mpsoft = "36.835699,10.2291889";
    final Uri gurl = Uri(
        scheme: 'https',
        host: 'comgooglemaps',
        path: '://',
        queryParameters: {'center': '$mpsoft'});
    final Uri aurl = Uri(
        scheme: 'https',
        host: 'maps.apple.com',
        path: '/',
        queryParameters: {'q': '$mpsoft'});
    //final String gurl = "comgooglemaps://?center=$mpsoft";
    //final String aurl = "https://maps.apple.com/?q=$mpsoft";
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        FlutterMap(
          //mapController: _mapController,
          options: MapOptions(
              center: LatLng(36.83563875901047, 10.229695495535411),
              zoom: 15.0,
              maxZoom: 19.0),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(36.83563875901047, 10.229695495535411),
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
                                  'Manager Partner Software (MpSoft)',
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
                                        '6 rue lac Toba، Les berges du lac, Tunis 1053',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.0),
                                Row(
                                  children: [
                                    Icon(Icons.access_time),
                                    SizedBox(width: 8.0),
                                    Text(
                                      'Open',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.0),
                                Row(
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(width: 8.0),
                                    Text(
                                      '71 965 338',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    SizedBox(width: 16.0),
                                    IconButton(
                                      icon: Icon(Icons.call),
                                      color: Colors.blue,
                                      onPressed: () {
                                        call("71 965 338");
                                        // Call button action
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.0),
                                Row(
                                  children: [
                                    Image.network(
                                      'https://lh3.googleusercontent.com/p/AF1QipMs-UG2ktMzWlAm7t0LE6wRJIyPfNYsyQ872aTT=s680-w680-h510',
                                      width: 100.0,
                                      height: 100.0,
                                    ),
                                    SizedBox(width: 8.0),
                                    /*  Image.network(
                'https://example.com/image2.jpg',
                width: 100.0,
                height: 100.0,
              ),
              SizedBox(width: 8.0),
              Image.network(
                'https://example.com/image3.jpg',
                width: 100.0,
                height: 100.0,
              ), */
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
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
}
