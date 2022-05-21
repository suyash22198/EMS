import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/ui/screen/home_sceen.dart';

class HomeBuilder extends StatelessWidget {
  const HomeBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: Classes.homeScreen,
      onGenerateRoute: (RouteSettings routeSettings) {
        switch (routeSettings.name) {
          case Classes.homeScreen:
            {
              return MaterialPageRoute(
                  builder: (_) => HomeScreen(),
                  settings: RouteSettings(name: routeSettings.name));
            }
        }
      },
    );
  }
}
