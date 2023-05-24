import 'package:caishenn/agences/agences.dart';
import 'package:caishenn/contact/contact.dart';
import 'package:caishenn/home/languages/language.dart';
import 'package:caishenn/home/languages/language_constants.dart';
import 'package:caishenn/login&signup/Login.dart';
import 'package:caishenn/simulateur/simulateur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'main.dart';
import 'tools/Colors.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: size.height * 0.55,
                  width: size.width,
                  child: Image.asset(
                    'assets/images/Finance_leaders.png',
                  ),
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: size.width * 0.183,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<Language>(
                        alignment: Alignment.center,
                        hint: Icon(
                          Icons.language,
                          color: bleufonce,
                          size: 40,
                        ),
                        iconSize: 0,
                        isExpanded: true,
                        items: Language.languageList()
                            .map<DropdownMenuItem<Language>>(
                              (e) => DropdownMenuItem<Language>(
                                value: e,
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        e.flag,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(e.name)
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (Language? language) async {
                          if (language != null) {
                            Locale locale =
                                await setLocale(language.languageCode, "");
                            MyApp.setLocale(context, locale);
                            print(locale);
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  )),
              Positioned(
                top: size.height * 0.5,
                child: Text(
                  translation(context).bienvenue,
                  style: TextStyle(
                    color: jaune,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.59,
                child: Text(
                  translation(context).firstParag,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.7,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: MaterialStatePropertyAll<Color>(
                          rose,
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(186, 50)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Login()));
                    },
                    label: Text(
                      translation(context).commencerVotreProcessus,
                      style: TextStyle(fontSize: 20),
                    ),
                    icon: Icon(
                      Icons.arrow_right_alt,
                      size: 40,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.8,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        rose,
                      ),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(186, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => simulateur()));
                  },
                  child: Text(
                    translation(context).accesSimulateur,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: size.width,
                  height: size.height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => agences()),
                          );
                        },
                        child: Container(
                          height: size.height * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              Text(
                                translation(context).agences,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(width: size.width * 0.15),
                      Container(
                        width: 1,
                        height: size.height * 0.04,
                        color: Colors.white,
                      ),
                      Container(width: size.width * 0.15),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => contact()),
                          );
                        },
                        child: Container(
                          height: size.height * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.contact_phone,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                translation(context).contact,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
