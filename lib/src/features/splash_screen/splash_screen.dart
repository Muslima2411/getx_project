import 'package:first_project/src/features/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              shape: const StadiumBorder(),
              minWidth: 200,
              height: 70,
              onPressed: () {
                Get.updateLocale(const Locale('en', 'US'));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (c) => const HomePage()));
              },
              color: Colors.purpleAccent,
              child: const Text(
                "English",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            MaterialButton(
              shape: const StadiumBorder(),
              minWidth: 200,
              height: 70,
              onPressed: () {
                Get.updateLocale(const Locale('uz', 'UZ'));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (c) => const HomePage()));
              },
              color: Colors.purpleAccent,
              child: const Text(
                "Uzbek",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            MaterialButton(
              shape: const StadiumBorder(),
              minWidth: 200,
              height: 70,
              onPressed: () {
                Get.updateLocale(const Locale('ru', 'RU'));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (c) => const HomePage()));
              },
              color: Colors.purpleAccent,
              child: const Text(
                "Russian",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
