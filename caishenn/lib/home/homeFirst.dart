import 'package:flutter/material.dart';
import '../demande/demande.dart';
import '../models/token.dart';
import '../tools/Colors.dart';

class homeFirst extends StatefulWidget {
  final Token token ;
  const homeFirst({super.key, required this.token});

  @override
  State<homeFirst> createState() => _homeFirstState();
}

class _homeFirstState extends State<homeFirst> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        widget.token.status == "Libre" ? contenaire(size, context) : contenaire_after(size),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "Processus Crédit",
            style: TextStyle(
              color: bleufonce,
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
              color: bleuclaire2,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(
              "Echéancier",
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
              color: rose,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(
              "Demende Officielle",
              style: TextStyle(
                  color: bleufonce, fontSize: 14, fontWeight: FontWeight.w500),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "Simulation Financière",
            style: TextStyle(
              color: bleufonce,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: size.height * 0.1,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 241, 237),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300, blurRadius: 5, spreadRadius: 1),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                child: SizedBox(
                    height: size.height * 0.08,
                    child: Image.asset('assets/images/question.png')),
              ),
              Positioned(
                right: 0,
                child: Text(
                  "évalue les possibilités d'emprunt. Tout comme une calculette,\nle simulateur de crédit a pour but de simuler le coût du crédit\nà la consommation et sa durée",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Icon(
                  Icons.arrow_right_alt,
                  size: 30,
                  color: rose,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container contenaire(Size size, BuildContext context) {
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
                    "Bienvenue ${widget.token.nom}",
                    style: TextStyle(
                        color: rose,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Text(
                    "Commencer Votre Processus,\navec des Etapes Simples.",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 11,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => demande(token:widget.token,)));
                    },
                    child: Container(
                      width: (size.width * 0.8) * 0.45,
                      height: (size.height * 0.3) * 0.15,
                      decoration: BoxDecoration(
                          color: bleufonce,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "Commencer",
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
                child: Image.asset('assets/images/homefirst.png'),
              ),
            ),
          ],
        ),
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
                    "Félicitation ${widget.token.nom}",
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
                        text: "Votre demande est "
                      ),
                      TextSpan(
                        text: "${widget.token.status}\n",
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
