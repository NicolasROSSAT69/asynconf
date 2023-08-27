import 'package:asynconf/pages/add_event_page.dart';
import 'package:asynconf/pages/event_page.dart';
import 'package:asynconf/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
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

class _MyAppState extends State<MyApp> {

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
        // Changement de page en fonction de _currentIndex
        body: [
          HomePage(),
          EventPage(),
          AddEventPage()
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setCurrentIndex(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          iconSize: 30,
          elevation: 10,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Accueil'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Planning'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Ajout'
            ),
          ],
        ),
      ),
    );
  }
}

