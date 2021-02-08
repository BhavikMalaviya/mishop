import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helpers/variable_keys.dart';
import 'route_generator.dart';
import 'helpers/app_config.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppWrapper());
}

class AppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppModel(),
        ),
      ],
      child: MainApp(),
    );
  }
}

class AppModel extends ChangeNotifier {
  Locale _appLocale = Locale('en');
  Locale get appLocal => _appLocale ?? Locale('en');
  void changeDirection(Locale local) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', local.toString());
    _appLocale = local;
    notifyListeners();
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: AppData.appName,
      initialRoute: RouteKeys.SPLASH,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: themeData,
    );
  }
}

ThemeData themeData = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: Colors.white,
  canvasColor: Colors.white,
  textSelectionColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 0,
    foregroundColor: Colors.white,
  ),
  brightness: Brightness.light,
);
