import 'package:caishenn/home/suivi/card_dem.dart';
import 'package:caishenn/models/demande.dart';
import 'package:caishenn/services/demande_service.dart';
import 'package:caishenn/tools/Colors.dart';
import 'package:flutter/material.dart';

import '../../models/token.dart';

class suivi extends StatefulWidget {
  final Token token ;
  const suivi({super.key, required this.token});

  @override
  State<suivi> createState() => _suiviState();
}

class _suiviState extends State<suivi> {
  

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
        child: FutureBuilder(
        
          future: _readdemands(widget.token.id_user!),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData){
              print(snapshot.data);
              return Column(
              children: [
                  
                ListView.separated(
                  reverse: true,
                  shrinkWrap: true,
                itemBuilder: (context, i) {
                  print(snapshot.data![i]);
                  if (snapshot.data![i] != "error") {
                    return card_dem(height: height, width: width, dem: demande.fromJson(snapshot.data![i]), token: widget.token);
                  } else {
                    return Container();
                  }
                  
                },
                separatorBuilder: (context, i) {
                  return Container(
                    height: height * 0.01,
                  );
                },
                itemCount: snapshot.data!.length,
                  ),
              ],
            );
            }else {
              return Column(
                children: [
                  Container(height: height*0.1,),
                  SizedBox(height: height*0.3, child: Image.asset('assets/images/empty.png'))
                ],
              );
            }
            
          }
        ),
      ),
    );

  }
  Future<List<dynamic>>  _readdemands (String id) async {
    var deme = await demandeservice.getdemands(id,widget.token);
    print(deme);
    return deme;   
  }
}
