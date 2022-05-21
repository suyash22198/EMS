import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/ui/screen/Profile_screen.dart';
import 'package:flutter_boiler_plate/ui/screen/home_builder.dart';
import 'package:flutter_boiler_plate/ui/screen/home_sceen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({ Key? key }) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with SingleTickerProviderStateMixin {
    int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Report',
      style: optionStyle,
    ),
    Text(
      'Notification',
      style: optionStyle,
    ),
   ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 4,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: AppColors.secondaryColor,
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.secondaryColor,
              icon: Icon(Icons.report),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.secondaryColor,
              icon: Icon(Icons.notifications_none),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.secondaryColor,
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.primaryColor,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
    
        ),
      ),
    );
  }
}