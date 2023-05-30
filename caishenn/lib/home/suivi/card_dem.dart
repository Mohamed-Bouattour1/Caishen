import 'package:caishenn/home/suivi/details.dart';
import 'package:caishenn/models/demande.dart';
import 'package:caishenn/models/token.dart';
import 'package:caishenn/services/simulation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../results/results.dart';
import '../../tools/Colors.dart';

class card_dem extends StatefulWidget {
   card_dem({
    super.key,
    required this.height,
    required this.width,
    required this.dem,
    required this.token
  });

  final double height;
  final double width;
  final demande dem;
  final Token token;

  @override
  State<card_dem> createState() => _card_demState();
}

class _card_demState extends State<card_dem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => details(
                                        dem: widget.dem,
                                      )));
      },
      child: Slidable(
        child: Container(
          height: widget.height*0.1,
          width: widget.width,
          color: bleuclaire1,
          child: Center(
            child: ListTile(
              leading: Image.asset('assets/images/back-in-time.png'),
              title: Text(widget.dem.mnt_crd.toString()),
              subtitle: Text(widget.dem.status!),
              //trailing: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        /* endActionPane:  ActionPane(
      motion: BehindMotion(),
      children: [
        SlidableAction(
          // An action can be bigger than the others.
          onPressed: (context)async{
           
              await simulationService.deletesim(widget.sim.id_sim!, widget.token);
            setState(() {
              
            });
            
            /* Navigator.push(
                  context, MaterialPageRoute(builder: (_) => history(token: widget.token,))); */
                  /* Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => history(token: widget.token))); */
          },
          backgroundColor: rose,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Supprimer',
        ),
        SlidableAction(
          // An action can be bigger than the others.
          onPressed: (context){
            setState(() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => results(sim: widget.sim, token: widget.token,)));
            });
          },
          backgroundColor: jaune,
          foregroundColor: Colors.white,
          icon: Icons.remove_red_eye,
          label: 'Détailles',
        ),
      ],
      ), */
      ),
    );
  }
}
