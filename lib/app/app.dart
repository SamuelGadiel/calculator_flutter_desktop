import 'package:calculator/app/pages/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.light().copyWith(primary: Colors.indigo[900]),
      ),
      home: const HomePage(),
    );
  }
}
