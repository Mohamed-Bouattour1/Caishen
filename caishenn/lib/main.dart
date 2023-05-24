import 'package:caishenn/home/languages/language_constants.dart';
import 'package:caishenn/tools/Colors.dart';
import 'package:caishenn/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: bleufonce,
      systemNavigationBarColor: bleufonce,
    ),
  );
  
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}
class _MyAppState extends State<MyApp> {
     
  // This widget is the root of your application.
  Locale? _locale;
 setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caishenn',
      /* theme: ThemeClass.light,
      darkTheme: ThemeClass.dark,
      themeMode: ThemeMode.system, */
       localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      home:  MyHomePage(
        title: 'caishen',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return welcome();
  }
}
