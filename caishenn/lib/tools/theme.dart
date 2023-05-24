/* import 'package:flutter/material.dart';


class ThemeClass {

  final Color bleuclaire1 =  Color.fromRGBO(222,238,248,1);
  final Color bleuclaire5 =  Color.fromRGBO(222,238,248,0.5);
  final Color bleuclaire2 = Color.fromRGBO(186,215,233, 1);
  final Color bleufonce = Color.fromRGBO(4, 23, 117, 1);
  final Color bleufonce1 = Color.fromRGBO(4, 23, 117, 1).withOpacity(0.3);
  final Color rose = Color.fromARGB(255, 223, 54, 81);
  final Color rose1 = Color.fromARGB(255, 223, 54, 81).withOpacity(0.8);
  final Color jaune = Color(0xFFF5BE48);
  final Color jaune1 = Color.fromRGBO(245, 190, 72, 1).withOpacity(0.5);



  static ThemeData light = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: ColorScheme.light().copyWith(
      primary: _themeClass.bleufonce,
      
    ),
  );
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(111, 80, 77, 77),
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(color:_themeClass.rose ),
      titleMedium: TextStyle(color:Colors.white ),
      labelLarge: TextStyle(color: Colors.deepPurpleAccent),
    ),
    colorScheme: ColorScheme.dark().copyWith(
      primary: _themeClass.bleufonce,
    ),
  );
}
ThemeClass _themeClass = ThemeClass(); */



















/* ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  return ThemeData(
    scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
    textTheme: Theme.of(context)
        .textTheme
        .copyWith(
          titleSmall:
              Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 11),
        )
        .apply(
          bodyColor: isDarkTheme ? Colors.white : Colors.black,
          displayColor: Colors.grey,
        ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(
          isDarkTheme ? Colors.orange : Colors.purple),
    ),
    listTileTheme: ListTileThemeData(
        iconColor: isDarkTheme ? Colors.orange : Colors.purple),
    appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        iconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white : Colors.black54)),
  );
} */