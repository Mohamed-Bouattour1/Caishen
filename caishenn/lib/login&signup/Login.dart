import 'package:flutter/material.dart';
import '../home/languages/language_constants.dart';
import '../tools/Colors.dart';
import '../tools/newclip.dart';
import 'LoginForm.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.3,
              width: double.infinity,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: bleufonce,
                  ),
                ),
                ClipPath(
                  clipper: newclip(),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/Mobile_login.png',
                ),
                Positioned(
                  bottom: 0,
                  child: Text(
                    translation(context).bienvenue,
                    style: TextStyle(
                      color: jaune,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.08,),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
