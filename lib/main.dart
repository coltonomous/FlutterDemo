import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Celebrity Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 87, 153, 89)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Celebrity Game Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int axisElements = 3;

  List<String> rowLetters = [];
  List<String> columnLetters = [];
  List<Object> initData = []; // Initial pull from db; comes after starting letters defined
  
  void initAxis(){
    // Reset letters
    rowLetters = [];
    columnLetters = [];

    // TODO: Allow certain characters/ combinations by game difficulty
    var chars = 'abcdefghijklmnopqrstuvwxyz';

    for(var i = 0; i < axisElements; i++){
      var rowLetter = _generateRandomString(1, chars);
      chars = chars.replaceAll(rowLetter, ''); // TODO: Allow option for alliterative names

      var columnLetter = _generateRandomString(1, chars);
      chars = chars.replaceAll(columnLetter, '');

      rowLetters.add(rowLetter);
      columnLetters.add(columnLetter);
    }

    setState(() {});

    // TODO: Make initial api pull using these letters
  }

  // Helper function to generate randomized string using supplied characters
  String _generateRandomString(int len, String chars) {
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
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Rows: $rowLetters',
            ),
            Text(
              'Columns: $columnLetters',
            ),
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
