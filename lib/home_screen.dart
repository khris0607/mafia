import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBBDEFB),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                      "Народ засинає.../Прокидаються депутати...",
            style: TextStyle(
                  color: textColor,
                  fontSize: 36,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold
            )
                  ),
                  const Spacer(),
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: yellowColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                ),
            onPressed: () {
              GoRouter.of(context).push("/offline");
            }, child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
          "Нова гра",
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 20),),
            )),
          ],
        ),
      ),
    ));
  }
}
