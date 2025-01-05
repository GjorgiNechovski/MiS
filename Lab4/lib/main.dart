import 'package:flutter/material.dart';
import 'package:lab4/providers/examProvider.dart';
import 'package:lab4/screens/calendar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExamProvider(),
      child: MaterialApp(
        title: "Exam schedules",
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: CalendarScreen(),
      ),
    );
  }
}