import 'package:caishenn/home/languages/language_constants.dart';
import 'package:caishenn/login&signup/Login.dart';
import 'package:caishenn/services/simulation_service.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../tools/Colors.dart';
import '../tools/newclip.dart';
import '../services/authService.dart';
import '../tools/utilities.dart';

class NewPASS extends StatefulWidget {
  String token;
  NewPASS({super.key, required this.token});

  @override
  State<NewPASS> createState() => _NewPASS();
}

class _NewPASS extends State<NewPASS> {
  final _formKey = GlobalKey<FormState>();
  var newpass ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              width: double.infinity,
              child: Stack(alignment: Alignment.topCenter, children: [
                Positioned(
                  child: ClipPath(
                    clipper: newclip(),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.58,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: gradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    'assets/images/Forgot_password.png',
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Text(
                    translation(context).recupererMotDePasse,
                    style: TextStyle(
                      color: jaune,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: recup(context),
            )
          ],
        ),
      ),
    );
  }

  Form recup(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              obscureText: true,
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: bleufonce,
                    fontSize: 19,
                  ),
                  labelText: translation(context).motdepasse,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(5.0)),
              validator: (value) {
                if (value!.isEmpty) {
                  return translation(context).entrerVotreMotDePasse;
                }
                if (value.length < 8) {
                  return translation(context).motDePasseTropCourt;
                } else
                  newpass = value;
                return null;
              },
              onChanged: (value) {
                _formKey.currentState!.validate();
              },
              onSaved: (value) {
               newpass = value;
              },
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: bleufonce,
                  fontSize: 19,
                ),
                labelText: translation(context).confirmerMotDePasse,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.0,
                  ),
                ),
                contentPadding: EdgeInsets.all(5.0)),
            validator: (value) {
              if (value!.isEmpty) {
                return translation(context).confirmerMotDePasse;
              } else if (value != newpass) {
                return translation(context).confirmerMotDePasse;
              }
              return null;
            },
            onChanged: (value) {
              _formKey.currentState!.validate();
            },
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async{
              if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
      var res = await authService.resetpass(newpass, this.widget.token);
      print(res);
    if (res) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => Login()));
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackbar(
            'Erreur!!','Vérifiez vos informations ou il se peut que vos information sont deja prises'));
    }
  }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: rose,
              padding: const EdgeInsets.all(0.0),
              elevation: 3,
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              constraints: const BoxConstraints(
                minWidth: 150.0,
                minHeight: 45,
              ),
              child: Text(
                translation(context).changerMotDePasse,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
