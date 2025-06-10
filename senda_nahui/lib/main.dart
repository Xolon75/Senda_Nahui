import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senda_nahui/screens/intro_screen.dart';
import 'package:senda_nahui/screens/home_screen.dart';
import 'package:senda_nahui/screens/docente_main_screen.dart';
import 'package:senda_nahui/screens/perfil_screen.dart';
import 'package:senda_nahui/screens/ayuda_screen.dart';
import 'package:senda_nahui/screens/settings_screen.dart';
import 'package:senda_nahui/providers/theme_notifier.dart';
import 'package:senda_nahui/providers/settings_notifier.dart';

// Define the light and dark themes
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.deepPurple,
  fontFamily: 'Roboto',
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.white,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.deepPurple,
  fontFamily: 'Roboto',
  scaffoldBackgroundColor: Colors.grey[900],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[850],
    foregroundColor: Colors.white,
  ),
);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => SettingsNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeProvider.themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroScreen(),
        '/home': (context) => const HomeScreen(),
        '/zona-docente': (context) => const DocenteMainScreen(),
        '/perfil': (context) => const PerfilScreen(),
        '/ayuda': (context) => const AyudaScreen(),
        '/configuracion': (context) => const SettingsScreen(),
      },
    );
  }
}
