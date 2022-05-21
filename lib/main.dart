import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/locale/app_localizations.dart';
import 'package:flutter_boiler_plate/routing.dart';
import 'package:flutter_boiler_plate/store/attendance/attendance.dart';
import 'package:flutter_boiler_plate/store/login/login.dart';
import 'package:flutter_boiler_plate/store/register/register.dart';
import 'package:flutter_boiler_plate/store/splash/splash_store.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppLocalizations();
  runApp(MultiProvider(
    providers: [Provider(create: (_) => Login()),
    Provider(create: (_) => Splash(),),
    Provider(create: (_) => Register()),
    Provider(create: (_) => Attendance())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Boiler Plate',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [const Locale('en'), const Locale('hi')],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Routing.generateRoute,
      initialRoute: Classes.splashScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
