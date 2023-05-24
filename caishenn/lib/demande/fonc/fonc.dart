import 'package:caishenn/demande/fonc/scan/scan.dart';
import 'package:caishenn/demande/fonc/upload/upload.dart';
import 'package:flutter/material.dart';

import '../../tools/Colors.dart';

class fonc extends StatefulWidget {
  const fonc({super.key});

  @override
  State<fonc> createState() => _foncState();
}

class _foncState extends State<fonc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.spaceAround ,
        children: [
          ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        rose,
                      ),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(186, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => upload()));
                  },
                  child: Text(
                    "upload",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        rose,
                      ),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(186, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => DocumentScanner()));
                  },
                  child: Text(
                    "scan",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        rose,
                      ),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(186, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => upload()));
                  },
                  child: Text(
                    "haja okhra",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
        ],
      ),
    );
  }
}