import 'package:flutter/material.dart';
import 'package:scrolling_performance_test/UI/Main/main_screen.dart';
import 'package:scrolling_performance_test/app_scope.dart';

// ignore: must_be_immutable
class App extends StatelessWidget {
  AppScope scope = AppScope();

  App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrolling Performance Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainScreen(deps: MainScreenDeps(feedManager: scope.feedManager)),
    );
  }
}
