import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: returnThemeData(),
      home: const MyHomePage(),
    );
  }
}

ThemeData returnThemeData() {
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromRGBO(169, 235, 173, 1),
    secondaryHeaderColor: const Color.fromRGBO(171, 140, 55, 1),
    //colorScheme: Colors.fromRGBO()
    useMaterial3: true,
  );
  return darkTheme;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
        appBar: AppBar(
          title: const Text("Demo App"),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(10),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: List.generate(100, (index) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: const EdgeInsets.all(10),
                child: const Center(
                  child: Folder(),
                ),
              ),
            );
          }),
        ));
  }
}

class Folder extends StatelessWidget {
  const Folder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          Center(
            child: Icon(Icons.folder),
          ),
          Center(
            child: Text("Folder"),
          ),
          Center(
            child: Icon(Icons.call, color: Colors.red),
          ),
          Center(
            child: Icon(Icons.call, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
