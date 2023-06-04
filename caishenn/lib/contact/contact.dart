import 'package:caishenn/home/languages/language_constants.dart';
import 'package:flutter/material.dart';
import '../agences/agences.dart';
import '../tools/Colors.dart';
import '../tools/ContainerClipper1.dart';
import '../services/send_call.dart';
import '../tools/newclip.dart';

class contact extends StatefulWidget {
  const contact({super.key});

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  String phone = "+21625182716" ;
  String mail = "Support@Contact.com " ;

  @override
  Widget build(BuildContext context) {
    final  height = MediaQuery.of(context).size.height;
    final  width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
          ClipPath(
            clipper: newclip(),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                color: bleufonce
                /* gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                ), */
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 9,
            left: MediaQuery.of(context).size.width / 4,
            child: Text(
               translation(context).contactezNous,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: height/4,
            child:Container(
              width: width,
              height: height*0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone,color: jaune,size: 30,),
                      Text("+216 25 182 716 ",
                      style: TextStyle(color: bleufonce,fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        call(phone);
                      });
                    },
                    child: Container(
                      height: height*0.05,
                      width: width*0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: rose,),
                            color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(translation(context).appeler,
                  style: TextStyle(color: rose,fontSize: 15),),
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.07,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mail,color: jaune,size: 30,),
                      Text("Support@Contact.com ",
                      style: TextStyle(color: bleufonce,fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        send_mail(mail);
                      });
                    },
                    child: Container(
                      height: height*0.05,
                      width: width*0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: rose,),
                            color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(translation(context).eMail,
                  style: TextStyle(color: rose,fontSize: 15),),
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.07,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on,color: jaune,size: 30,),
                      Text(translation(context).adresse,
                      style: TextStyle(color: bleufonce,fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => agences()),
                            );
                        },
                        child: Container(
                          height: height*0.05,
                          width: width*0.55,
                          decoration: BoxDecoration(
                            border: Border.all(color: rose,),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(translation(context).voirToutesLesAgences,
                      style: TextStyle(color: rose,fontSize: 15),),
                          ),
                        ),
                      ),
                      ],
              ),
            ),
          ),
         
        ]),
      ),
    );
  }
}