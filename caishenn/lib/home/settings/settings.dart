// ignore_for_file: unused_local_variable

import 'package:caishenn/models/token.dart';
import 'package:flutter/material.dart';

import '../../login&signup/NewPASS.dart';
import '../../main.dart';
import '../../tools/Colors.dart';
import '../languages/language.dart';
import '../languages/language_constants.dart';

class settingsPage extends StatefulWidget {
  Token token;
  settingsPage({super.key, required this.token});

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).parametres),
        backgroundColor: bleufonce,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DropdownButton<Language>(
                  iconSize: 30,
                  iconEnabledColor: rose,
                  hint: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        translation(context).localeName,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                        (e) => DropdownMenuItem<Language>(
                          value: e,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                e.flag,
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              Text(
                                e.name,
                              ),
                            ],
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
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sécurité',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                NewPASS(token: widget.token.token!)));
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
                      "Changer Mot De Passe",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
