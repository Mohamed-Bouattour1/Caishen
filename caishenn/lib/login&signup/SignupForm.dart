import 'package:caishenn/home/languages/language_constants.dart';
import 'package:caishenn/login&signup/validation.dart';
import 'package:caishenn/models/user.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import '../tools/Colors.dart';
import 'Login.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  var user = User.fromJson({});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 9),
                    child: TextFormField(
                      onChanged: (value) {
                        _formKey.currentState!.validate();
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: bleufonce,
                            fontSize: 19,
                          ),
                          labelText: translation(context).nom,
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
                          return translation(context).entrervotreNom;
                        }

                        return null;
                      },
                      onSaved: (value) {
                        user.nom = value;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    onChanged: (value) {
                      _formKey.currentState!.validate();
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: bleufonce,
                          fontSize: 19,
                        ),
                        labelText: "Prenom" /*  translation(context).nom */,
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
                        return "entrer votre prenom" /* translation(context).entrervotreNom */;
                      }

                      return null;
                    },
                    onSaved: (value) {
                      user.prenom = value;
                    },
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(top: 9),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _formKey.currentState!.validate();
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: bleufonce,
                            fontSize: 19,
                          ),
                          labelText:  "Cin"/* translation(context).nom */,
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
                          return "entrer votre cin"; /* translation(context).entrervotreNom; */
                        } else if (value.length < 8) {
                        return "cin trop court";
                      } else if (value.length > 8) {
                        return "cin trop long";
                      } 

                        return null;
                      },
                      onSaved: (value) {
                        user.cin = value ;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return translation(context).entrerVotreEmail;
                      } else if (!isEmail(value)) {
                        return translation(context).entrerUnEmailValide;
                      }

                      return null;
                    },
                    onChanged: (value) {
                      _formKey.currentState!.validate();
                    },
                    onSaved: (value) {
                      user.email = value;
                    },
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: bleufonce,
                          fontSize: 19,
                        ),
                        labelText: translation(context).email,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(5.0)),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
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
                        user.mdp = value;
                      return null;
                    },
                    onChanged: (value) {
                      _formKey.currentState!.validate();
                    },
                    onSaved: (value) {
                      user.mdp = value;
                    },
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
                      } else if (value != user.mdp) {
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
                    onPressed: () async {
                      validate(context,"signup",_formKey,user);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: rose,
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      constraints: const BoxConstraints(minWidth: 110.0),
                      child: Text(translation(context).creerUnCompte,
                          textAlign: TextAlign.center),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        translation(context).vousAvezDejaUnCompte,
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(172, 44, 43, 43)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Login()));
                          },
                          child: Text(
                            translation(context).connexion,
                            style: TextStyle(
                              fontSize: 12,
                              color: rose,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
