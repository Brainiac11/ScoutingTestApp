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
  void showSnackBar() {
    SnackBar snackBar = SnackBar(
      content: const Text("Hello from SnackBar"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
        foregroundColor: Colors.amber,
        backgroundColor: Colors.deepPurple,
      ),
      body: const Center(
        child: Column(
          children: [
            ButtonRow(),
            ButtonRow(),
            ButtonRow(),
          ],
        ),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, bottom: 30),
          child: Button(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, bottom: 30),
          child: Button(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, bottom: 30),
          child: Button(),
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          if (kDebugMode) {
            print("Hello from button");
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          minimumSize: const Size(100, 100),
          maximumSize: const Size(100, 100),
          elevation: 10,
          shadowColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          textStyle: Theme.of(context).textTheme.headlineMedium,
        ),
        child: const Text("SnackBar"),
      ),
    );
  }
}
