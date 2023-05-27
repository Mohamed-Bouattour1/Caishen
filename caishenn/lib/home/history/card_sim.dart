import 'package:caishenn/home/history/history.dart';
import 'package:caishenn/models/simulation.dart';
import 'package:caishenn/models/token.dart';
import 'package:caishenn/services/simulation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../results/results.dart';
import '../../tools/Colors.dart';

class card_sim extends StatefulWidget {
   card_sim({
    super.key,
    required this.height,
    required this.width,
    required this.sim,
    required this.token
  });

  final double height;
  final double width;
  final simulation sim;
  final Token token;

  @override
  State<card_sim> createState() => _card_simState();
}

class _card_simState extends State<card_sim> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: Container(
        height: widget.height*0.1,
        width: widget.width,
        color: bleuclaire1,
        child: Center(
          child: ListTile(
            leading: Image.asset('assets/images/back-in-time.png'),
            title: Text(widget.sim.montant_rnb_total.toString()),
            subtitle: Text(widget.sim.createdAt!),
            trailing: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      endActionPane:  ActionPane(
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
  ),
    );
  }
}
