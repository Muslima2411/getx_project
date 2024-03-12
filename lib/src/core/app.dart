import 'package:first_project/src/core/theming/theme.dart';
import 'package:first_project/src/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../features/home_page/home_binding.dart';
import '../features/home_page/home_page.dart';
import 'localization/language.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash_screen",
      translations: Messages(),
      // locale: const Locale('uz','UZ'),
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: "/splash_screen",
          page: () => const SplashScreen(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}
