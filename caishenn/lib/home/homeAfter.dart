/* import 'package:flutter/material.dart';

import '../tools/Colors.dart';

class homeAfter extends StatefulWidget {
  const homeAfter({super.key});

  @override
  State<homeAfter> createState() => _homeAfterState();
}

class _homeAfterState extends State<homeAfter> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        contenaire_after(size),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "Processus Crédit",
            style: TextStyle(
              color: rose,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * 0.1,
            ),
            Icon(
              Icons.circle,
              size: 10,
              color: jaune,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(
              "Demande de Crédit",
              style: TextStyle(
                  color: bleufonce, fontSize: 14, fontWeight: FontWeight.w500),
            )
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * 0.11,
            ),
            Container(
              width: 1,
              height: size.height * 0.05,
              color: Colors.grey.shade400,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * 0.1,
            ),
            Icon(
              Icons.circle,
              size: 10,
              color: Colors.grey,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(
              "Echéancier",
              style: TextStyle(
                  color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
            )
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * 0.11,
            ),
            Container(
              width: 1,
              height: size.height * 0.05,
              color: Colors.grey.shade400,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * 0.1,
            ),
            Icon(
              Icons.circle,
              size: 10,
              color: Colors.grey,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(
              "Demende Officielle",
              style: TextStyle(
                  color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "Dernière Simulation",
            style: TextStyle(
              color: rose,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          
          children: [
            SizedBox(width: size.width*0.05,),
            SizedBox(height: size.height*0.04, child: Image.asset('assets/images/back-in-time.png')),
            SizedBox(width: size.width*0.03,),
            Text(
            "26/02/2023",
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: size.width*0.03,),
          Text(
            "- simulation crédit en Durée     ",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          ],
        ),
        SizedBox(
          height: size.height*0.01,
        ),
        Row(
        
          children: [
            SizedBox(width: size.width*0.05,),
            SizedBox(height: size.height*0.04, child: Image.asset('assets/images/back-in-time.png')),
            SizedBox(width: size.width*0.03,),
            Text(
            "01/06/2023",
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: size.width*0.03,),
          Text(
            "- simulation crédit en Montant",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          ],
        ),
      ],
    );
  }

  Container contenaire_after(Size size) {
    return Container(
        width: size.width * 0.9,
        height: size.height * 0.3,
        decoration: BoxDecoration(
          color: bleuclaire5,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Félicitation Haifa",
                    style: TextStyle(
                        color: rose,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 11,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Votre demande a atteint"
                      ),
                      TextSpan(
                        text: " 62%,\n",
                        style: TextStyle(
                          color: rose,
                          fontWeight: FontWeight.bold
                          )
                      ),
                      TextSpan(
                        text: "il vous reste que queleques étapes ..."
                      ),
                    ],
                    ),
                    
                  ),
                  GestureDetector(
                    child: Container(
                      width: (size.width * 0.8) * 0.45,
                      height: (size.height * 0.3) * 0.15,
                      decoration: BoxDecoration(
                          color: bleufonce,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "Voir étapes suivantes",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                height: (size.width * 0.8) * 0.7,
                child: Image.asset('assets/images/Time_management-rafiki.png'),
              ),
            ),
          ],
        ),
      );
  }
}
 */