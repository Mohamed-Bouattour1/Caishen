import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String FRANCAIS = 'fr';
const String ARABIC = 'ar';

Future<Locale> setLocale(String languageCode, String s) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  print(_prefs.getString(LAGUAGE_CODE));
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return  Locale(ENGLISH, null);
    case FRANCAIS:
      return  Locale(FRANCAIS, null);
    case ARABIC:
      return  Locale(ARABIC, null);

    default:
      return  Locale(FRANCAIS, null);
  }
}

AppLocalizations translation(BuildContext context) {
  
  return AppLocalizations.of(context)!;
}
