import 'package:caishenn/home/languages/language_constants.dart';
import 'package:caishenn/login&signup/signup.dart';
import 'package:caishenn/login&signup/validation.dart';
import 'package:caishenn/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validators/validators.dart';
import '../tools/Colors.dart';
//import 'package:local_auth/local_auth.dart';
import 'resetpass.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  /* final LocalAuthentication auth = LocalAuthentication();
  bool supported = false;
  bool authorized = false; */
  final _formKey = GlobalKey<FormState>();
  var user = User.fromJson({});

 /*  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then((bool issupported) => setState(
          () {
            supported = issupported;
          },
        ));
  }
 */
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                 AutofillGroup(
                   child: Column (
                    children:[
                      Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        autofillHints: [AutofillHints.email],
                        onChanged: (value) {
                          _formKey.currentState!.validate();
                        },
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
                        onSaved: (value) {
                          user.email = value;
                        },
                        decoration: InputDecoration(
                            labelText: translation(context).email,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: bleufonce,
                              fontSize: 19,
                            ),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        autofillHints: [AutofillHints.password],
                        onEditingComplete: () => TextInput.finishAutofillContext(),
                        onChanged: (value) {
                          _formKey.currentState!.validate();
                        },
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return translation(context).entrerVotreMotDePasse;
                          }
                          if (value.length < 8) {
                            return translation(context).motDePasseTropCourt;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          user.mdp = value;
                        },
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
                      ),
                    ),
                    ]
                    ),
                 ),
                  const SizedBox(
                    height: 7.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      validate(context,"login",_formKey,user);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: rose,
                      padding: EdgeInsets.all(0.0),
                      elevation: 3,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      constraints: const BoxConstraints(
                        minWidth: 150.0,
                        minHeight: 45,
                      ),
                      child: Text(
                        translation(context).connecter,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => resetpass()),
                        );
                      },
                      child: Text(
                        translation(context).motDePasseOublie,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(93, 159, 202, 1),
                        ),
                      )),
                 /*  if (supported)
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                      child: Row(children: <Widget>[
                        Expanded(child: Divider(color: Colors.black)),
                        Text(translation(context).seConnecterAvec,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(172, 44, 43, 43))),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                      ]),
                    ),
                  if (supported)
                    InkWell(
                      onTap: () {
                        Authenticate();
                      },
                      child: Container(
                        width: 60,
                        child: Center(
                          child: authorized == false
                              ? Icon(
                                  Icons.fingerprint,
                                  color: bleufonce,
                                  size: 60,
                                )
                              : Icon(
                                  Icons.check,
                                  color: bleufonce,
                                  size: 60,
                                ),
                        ),
                      ),
                    ), */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        translation(context).pasdeCompte,
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(172, 44, 43, 43)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const signup()),
                            );
                          },
                          child: Text(
                            translation(context).nouveauCompte,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(223, 54, 81, 1),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  

  /* Future<void> Authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: "login",
        options: AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      authorized = authenticated ? true : false;
      if (authorized) {
        //Navigator.push(context, MaterialPageRoute(builder: (_) => home()));
      }
    } on PlatformException catch (e) {
      print(e);
    }
  } */
  
}
