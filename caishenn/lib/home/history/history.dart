import 'package:caishenn/models/simulation.dart';
import 'package:flutter/material.dart';
import '../../services/simulation_service.dart';

import '../../models/token.dart';
import 'card_sim.dart';

class history extends StatefulWidget {
  final Token token ;
  const history({super.key, required this.token});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: FutureBuilder(
        
          future: _readsimulation(),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData){
              print(snapshot.data);
              return Column(
              children: [
                Container(height:height*0.1,),
                  
                ListView.separated(
                  reverse: true,
                  shrinkWrap: true,
                itemBuilder: (context, i) {
                  print(simulation.fromJson(snapshot.data![i]));
                  return card_sim(height: height, width: width, sim: simulation.fromJson(snapshot.data![i]), token: widget.token);
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
  Future<List<dynamic>>  _readsimulation () async {
    var simu = await simulationService.getAllsimRequest(widget.token);
    print(simu);
    return simu;   
  }
}
