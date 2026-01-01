import 'package:flutter/material.dart';
import 'package:simple_store/core/pages/tabs_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final Color colorSeed = const Color.fromARGB(255, 0, 140, 255);
  final Color colorSeedDark = const Color.fromARGB(255, 14, 62, 100);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          surface: Colors.white,
          seedColor: colorSeed,
          brightness: Brightness.light,
        ),
        cardTheme: CardThemeData(elevation: 0.0),
        textTheme: GoogleFonts.latoTextTheme(
          const TextTheme(
            bodyLarge: TextStyle(fontSize: 18),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12),
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(height: 56),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          //surface: Colors.black,
          seedColor: colorSeedDark,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.latoTextTheme(
          const TextTheme(
            bodyLarge: TextStyle(fontSize: 18),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12),
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(height: 60),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      themeMode: ThemeMode.light,

      home: Builder(
        builder: (context) {
          return Scaffold(
            // appBar: AppBar(
            //   //title: SearchTab(),
            //   backgroundColor: Theme.of(context).colorScheme.surface,
            // ),
            body: TabsScreen(),
          );
        },
      ),
    );
  }
}
