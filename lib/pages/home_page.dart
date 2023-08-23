import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'event_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton.icon(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                        backgroundColor: MaterialStatePropertyAll(Colors.green)
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const EventPage()
                          )
                      );
                    },
                    label: const Text("Afficher le planning",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    icon: const Icon(Icons.calendar_month)
                )
              ],
            )
        )
    );
  }
}