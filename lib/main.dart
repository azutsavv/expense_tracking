import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var KcolorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 70, 5, 175));
var KDarkColorScheme =
    ColorScheme.fromSeed(
      brightness: Brightness.dark ,
      seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      
      darkTheme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: KDarkColorScheme,

       scaffoldBackgroundColor: KDarkColorScheme.onSecondaryContainer,
        appBarTheme: AppBarTheme(
            backgroundColor: KDarkColorScheme.primaryContainer,
            foregroundColor: KDarkColorScheme.onPrimaryContainer,
          ),
          cardTheme: CardTheme(
            color: KDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 10,
            shadowColor: KDarkColorScheme.primaryContainer,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: KDarkColorScheme.primaryContainer,
            foregroundColor: KDarkColorScheme.onPrimaryContainer,
          )),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  color: KDarkColorScheme.onSecondaryContainer,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              )
      ),



      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: KcolorScheme,
          appBarTheme: AppBarTheme(
            backgroundColor: KcolorScheme.onPrimaryContainer,
            foregroundColor: KcolorScheme.primaryContainer,
          ),
          cardTheme: CardTheme(
            color: KcolorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 10,
            shadowColor: KcolorScheme.primaryContainer,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: KcolorScheme.primaryContainer,
          )),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  color: KcolorScheme.onSecondaryContainer,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              )),
      themeMode: ThemeMode.system ,


      initialRoute: '/expense',
      routes: {
        '/expense': (context) => const Expenses(),
      },
    );
  }
}
