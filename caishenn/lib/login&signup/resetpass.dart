import 'package:caishenn/home/languages/language_constants.dart';
import 'package:flutter/material.dart';
import '../tools/Colors.dart';
import 'package:validators/validators.dart';
import 'package:email_otp/email_otp.dart';
import '../tools/newclip.dart';
import '../services/authService.dart';
import 'NewPASS.dart';
import 'NewPASS.dart';

class resetpass extends StatefulWidget {
  resetpass({super.key});

  @override
  State<resetpass> createState() => _resetpassState();
}

class _resetpassState extends State<resetpass> {
  TextEditingController otp = new TextEditingController();
  TextEditingController _email = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  EmailOTP myauth = EmailOTP();
  late bool field;
  @override
  void initState() {
    setState(() {
      field = false;
    });
    super.initState();
  }

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
              padding: const EdgeInsets.all(25.0),
              child: field == true
                  ? recup(context, "Code", "Vérifier")
                  : recup(context, translation(context).email,
                      translation(context).recupererMotDePasse),
            ),
          ],
        ),
      ),
    );
  }

  Form recup(BuildContext context, String title, String button) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              controller: field == false ? _email : otp,
              keyboardType:
                  field ? TextInputType.number : TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (field == false) {
                  if (value!.isEmpty) {
                    return translation(context).entrerVotreEmail;
                  } else if (!isEmail(value)) {
                    return translation(context).entrerUnEmailValide;
                  }
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: title,
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          ElevatedButton(
            onPressed: () async {
              if (field == false) {
                if (_formKey.currentState!.validate()) {
                  myauth.setConfig(
                      appEmail: "me@rohitchouhan.com",
                      appName: "caishenn Email OTP",
                      userEmail: _email.text, // User email
                      otpLength: 6,
                      otpType: OTPType.digitsOnly);
                  if (await myauth.sendOTP() == true) {
                    setState(() {
                      field = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("OTP has been sent"),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Oops, OTP send failed"),
                    ));
                  }

                  // Use _email and _password variables to sign in
                  /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => resetpass())); */
                }
              } else {
                print(otp.text);
                if (await myauth.verifyOTP(otp: otp.text) == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("OTP is verified"),
                        
                  ));
                  
                  var token = await authService.checkmail(_email.text);
                  print(token.token);
                  if (token.token != "error") {
                    print("change password");
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>  NewPASS(token: token.token!)));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Invalid email "),
                    ));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Invalid OTP"),
                  ));
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
                button,
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
