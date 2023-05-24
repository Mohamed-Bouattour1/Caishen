import 'package:caishenn/models/simulation.dart';
import 'package:caishenn/models/token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../tools/Colors.dart';

class card_sim extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Slidable(
      child: Container(
        height: height*0.1,
        width: width,
        color: bleuclaire1,
        child: Center(
          child: ListTile(
            leading: Image.asset('assets/images/back-in-time.png'),
            title: Text(sim.montant_rnb_total.toString()),
            subtitle: Text(sim.createdAt!),
            trailing: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      endActionPane:  ActionPane(
    motion: BehindMotion(),
    children: [
      SlidableAction(
        // An action can be bigger than the others.
        onPressed: (context){},
        backgroundColor: rose,
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Supprimer',
      ),
      SlidableAction(
        // An action can be bigger than the others.
        onPressed: (context){},
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
