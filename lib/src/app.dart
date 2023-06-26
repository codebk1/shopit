import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:shopit/src/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Colors.blue.shade900,
        ),
        // appBarTheme: AppBarTheme(
        //     //backgroundColor: NavigationBarTheme.of(context).backgroundColor,
        //     ),
        navigationBarTheme: const NavigationBarThemeData(
          indicatorShape: CircleBorder(),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 60,
        ),
        textTheme: GoogleFonts.latoTextTheme(),
      ),
    );
  }
}
