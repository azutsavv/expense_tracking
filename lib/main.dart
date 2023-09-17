import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var KcolorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 70, 5, 175));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData().copyWith(
            useMaterial3: true, 
            colorScheme: KcolorScheme,
            appBarTheme: AppBarTheme(
              backgroundColor: KcolorScheme.onPrimaryContainer,
              foregroundColor: KcolorScheme.primaryContainer,
            ),

            cardTheme: CardTheme(
              color: KcolorScheme.secondaryContainer,
              margin:const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
              elevation: 10,
              shadowColor: KcolorScheme.primaryContainer,
            ),

            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: KcolorScheme.primaryContainer,
              )
            ),

            textTheme: ThemeData().textTheme.copyWith(
              
            )    

            
            
            
            ),

      initialRoute: '/expense',
      routes: {
        '/expense': (context) => const Expenses(),
      },
    );
  }
}
