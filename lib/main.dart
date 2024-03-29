import 'package:asynconf/pages/add_event_page.dart';
import 'package:asynconf/pages/event_page.dart';
import 'package:asynconf/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/svg.dart';
import 'package:global_bottom_navigation_bar/global_bottom_navigation_bar.dart';

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

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

  Widget buildSplashScreen() {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: SizedBox(
        height: 200,
        width: 200,
        child: SvgPicture.asset(
          "assets/images/logo.svg",
          color: Colors.blue,
        ),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      defaultNextScreen: buildMainScreen(),
    );
  }

  Widget buildMainScreen() {
    return Scaffold(
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
          AddEventPage(),
        ],
        listOfBottomNavigationItem: buildBottomNavigationItemList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: buildSplashScreen(),
    );

  }

  List<BottomNavigationItem> buildBottomNavigationItemList() => [
    BottomNavigationItem(
      activeIcon: const Icon(
        Icons.home,
        color: Colors.blue,
        size: 18,
      ),
      inActiveIcon: const Icon(
        Icons.home,
        color: Colors.grey,
        size: 21,
      ),
      title: 'Accueil',
      color: Colors.white,
      vSync: this,
    ),
    BottomNavigationItem(
      activeIcon: const Icon(
        Icons.calendar_month,
        color: Colors.blue,
        size: 18,
      ),
      inActiveIcon: const Icon(
        Icons.calendar_month,
        color: Colors.grey,
        size: 21,
      ),
      title: 'Planning',
      color: Colors.white,
      vSync: this,
    ),
    BottomNavigationItem(
      activeIcon: const Icon(
        Icons.add,
        color: Colors.blue,
        size: 18,
      ),
      inActiveIcon: const Icon(
        Icons.add,
        color: Colors.grey,
        size: 21,
      ),
      title: 'Ajout',
      color: Colors.white,
      vSync: this,
    ),
  ];

}

