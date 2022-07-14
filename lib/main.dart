import 'package:flutter/material.dart';
import 'package:projeto_aula1/pages/home_page.dart';
import 'pages/moedas_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moedas App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
