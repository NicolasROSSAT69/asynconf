import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Asynconf 2023"),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                    "assets/images/logo.svg",
                  color: Colors.blue,
                ),
                const Text(
                    "Asynconf 2023",
                  style: TextStyle(
                    fontSize: 42,
                    fontFamily: 'Poppins'
                  ),
                ),
                const Text(
                  "Salon virtuel de l'informatique. Du 27 au 29 octobre 2023",
                  style: TextStyle(
                    fontSize: 24
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            )
        )
      ),
    );
  }
}
