import 'package:flutter/material.dart';
import 'package:hogr_task/screens/screen1.dart';
import 'package:hogr_task/screens/screen2.dart';
import 'package:hogr_task/screens/screen3.dart';
import 'package:hogr_task/screens/tab3screen.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  int selectedIndex = 0;

  void _onItemTapped(int index) {
    if (selectedIndex == index) {
      // If the same tab is clicked, pop until the root of the navigator
      _navigatorKeys[index].currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          // Tab 1 Navigator
          Navigator(
            key: _navigatorKeys[0],
            initialRoute: '/',
            onGenerateRoute: (routeSettings) {
              switch (routeSettings.name) {
                case '/':
                  return MaterialPageRoute(builder: (context) => Screen1());
                case '/screen2':
                  return MaterialPageRoute(builder: (context) => Screen2());
                case '/screen3':
                  // Add route for Screen 3 within Tab 1
                  return MaterialPageRoute(
                      builder: (context) => Screen3(
                            cross: false,
                          ));
                default:
                  return null;
              }
            },
          ),

          // Tab 2 Navigator (starts with Screen 2)
          Navigator(
            key: _navigatorKeys[1],
            initialRoute: '/screen2',
            onGenerateRoute: (routeSettings) {
              switch (routeSettings.name) {
                case '/screen2':
                  return MaterialPageRoute(builder: (context) => Screen2());
                case '/screen3':
                  return MaterialPageRoute(
                      builder: (context) => Screen3(
                            cross: true,
                          ));
                default:
                  return null;
              }
            },
          ),

          Navigator(
            key: _navigatorKeys[2],
            initialRoute:
                '/', // Assuming Tab3Screen is the initial route for Tab 3
            onGenerateRoute: (routeSettings) {
              switch (routeSettings.name) {
                case '/':
                  return MaterialPageRoute(
                      builder: (context) => Tab3Screen(
                            callback: _onItemTapped,
                          ));
                default:
                  return null;
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: "Tab 1"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: "Tab 2"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_3), label: "Tab 3"),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
