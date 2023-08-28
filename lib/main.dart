import 'package:asynconf/pages/add_event_page.dart';
import 'package:asynconf/pages/event_page.dart';
import 'package:asynconf/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:global_bottom_navigation_bar/global_bottom_navigation_bar.dart';

import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {

  //Selection actuelle BottomNavigationBar
  int _currentIndex = 0;

  //Changement de selection BottomNavigationBar
  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: [
            const Text("Accueil"),
            const Text("Planning"),
            const Text("Formulaire")
          ][_currentIndex],
        ),
        body: ScaffoldGlobalBottomNavigation(
          listOfChild: const [
            HomePage(),
            EventPage(),
            AddEventPage()
          ],
          listOfBottomNavigationItem: buildBottomNavigationItemList(),
        ),
      ),
    );
  }

  List<BottomNavigationItem> buildBottomNavigationItemList() => [
    BottomNavigationItem(
      activeIcon: const Icon(
        Icons.notifications_active,
        color: Colors.amber,
        size: 18,
      ),
      inActiveIcon: const Icon(
        Icons.notifications_none,
        color: Colors.grey,
        size: 21,
      ),
      title: 'explore',
      color: Colors.white,
      vSync: this,
    ),
    BottomNavigationItem(
      activeIcon: const Icon(
        Icons.perm_camera_mic,
        color: Colors.amber,
        size: 18,
      ),
      inActiveIcon: const Icon(
        Icons.perm_contact_calendar,
        color: Colors.grey,
        size: 21,
      ),
      title: 'favorite',
      color: Colors.white,
      vSync: this,
    ),
    BottomNavigationItem(
      activeIcon: const Icon(
        Icons.person_pin,
        color: Colors.amber,
        size: 18,
      ),
      inActiveIcon: const Icon(
        Icons.person_outline,
        color: Colors.grey,
        size: 21,
      ),
      title: 'learn',
      color: Colors.white,
      vSync: this,
    ),
  ];

}

