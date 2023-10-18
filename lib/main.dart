import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelancer_app/screens/welcomeUI.dart';
import 'package:freelancer_app/utils/colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: [SystemUiOverlay.top]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: kScaffoldColorDarker,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        colorSchemeSeed: primaryColor,
        scaffoldBackgroundColor: kScaffoldColorDarker,
        appBarTheme: AppBarTheme(
          backgroundColor: kScaffoldColor,
          foregroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: primaryColor,
        ),
        cardTheme: CardTheme(
          color: primaryColorAccent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColorAccent,
            foregroundColor: kScaffoldColor,
            elevation: 0,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 17),
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          displayMedium: TextStyle(color: Colors.white),
          displaySmall: TextStyle(color: Colors.white),
          headlineLarge: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white),
        ),
      ),
      home: WelcomeUI(),
    );
  }
}
