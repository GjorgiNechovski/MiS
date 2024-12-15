import 'package:flutter/material.dart';
import 'package:lab2/screens/JokesList.dart';
import 'package:lab2/screens/home.dart';
import 'package:lab2/screens/randomJoke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '211177 Lab2',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/type') {
          final String type = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => JokesList(type: type),
          );
        }

        if (settings.name == '/randomJoke') {
          return MaterialPageRoute(
            builder: (context) => const Randomjoke(),
          );
        }

        // Default fallback
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      },
    );
  }
}
