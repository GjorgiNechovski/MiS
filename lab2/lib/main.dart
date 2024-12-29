import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab2/services/notificationsService.dart';
import 'package:provider/provider.dart';
import 'package:lab2/providers/FavouritesProvider.dart';
import 'package:lab2/screens/JokesList.dart';
import 'package:lab2/screens/home.dart';
import 'package:lab2/screens/randomJoke.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final notificationService = NotificationService();
  await notificationService.initialize();
  notificationService.scheduleEvery10Seconds();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: MaterialApp(
        title: '211177 Lab2',
        navigatorKey: navigatorKey,
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
      ),
    );
  }
}