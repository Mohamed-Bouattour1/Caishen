// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import '../../main.dart';
import '../languages/language.dart';
import '../languages/language_constants.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({super.key});

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
   
  @override
  Widget build(BuildContext context) {
    String e = "fr";
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).parametres),
      ),
      body: Column(
        children: [
          Center(
              child: DropdownButton<Language>(
            iconSize: 30,
            hint: Text(translation(context).localeName),
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                  (e) => DropdownMenuItem<Language>(
                    value: e,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          e.flag,
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(e.name)
                      ],
                    ),
                  ),
                )
                .toList(),
            onChanged: (Language? language) async {
              if (language != null) {
                Locale locale = await setLocale(language.languageCode, "");
                MyApp.setLocale( context,locale);
                print(locale);
              }
              setState(() {
                
              });
            },
          )),
          /* ElevatedButton(
                onPressed: () {
                        changeTheme(ThemeMode.light);
                      },
                      child: Text('Light theme')),
                  ElevatedButton(
                      onPressed: () {
                        changeTheme(ThemeMode.dark);
                      },
                      child: Text('Dark theme')), */
                      
  
          Row(
            children: [
              GestureDetector(
                
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  child: Text(translation(context).localeName),
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                  child: Text(translation(context).localeName),
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: Text(translation(context).localeName),
                ),
              ),
            ],
          )
        ],

      ),
    );
  }
  /* void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  } */
}
