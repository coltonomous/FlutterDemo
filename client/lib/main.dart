import 'package:flutter/material.dart';
import 'dart:math';

import './components/game_board.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Celebrity Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 87, 153, 89)),
        useMaterial3: true,
      ),
      home: const MainView(title: 'Celebrity Game Demo'),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key, required this.title});

  final String title;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int axisElements = 3;

  List<String> rowLetters = [];
  List<String> columnLetters = [];
  List<Object> initData = []; // Initial pull from db; comes after starting letters defined
  
  void initAxis(){
    // Reset letters
    rowLetters = [];
    columnLetters = [];

    // TODO: Allow certain characters/ combinations by game difficulty
    // var chars = 'abcdefghijklmnopqrstuvwxyz';
    var chars = 'abcdefghijklmnopqrstuvwyz';

    for(var i = 0; i < axisElements; i++){
      var rowLetter = generateRandomString(1, chars);
      chars = chars.replaceAll(rowLetter, ''); // TODO: Allow option for alliterative names

      var columnLetter = generateRandomString(1, chars);
      chars = chars.replaceAll(columnLetter, '');

      rowLetters.add(rowLetter);
      columnLetters.add(columnLetter);
    }

    setState(() {});

    // TODO: Make initial api pull using these letters
  }

  // Helper function to generate randomized string using supplied characters
  String generateRandomString(int len, String chars) {
    return List.generate(len, (index) => chars[Random().nextInt(chars.length)]).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FractionallySizedBox(child: 
              GameBoard(rowLetters, columnLetters),
              widthFactor: 0.5,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: initAxis,
        tooltip: 'Start',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
