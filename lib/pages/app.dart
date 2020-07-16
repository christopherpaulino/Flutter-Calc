

import 'package:calculator/pages/calculator_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorPage(),
      title: "Calculator Flutter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primaryColor: Color(0xffa8ce93),
        primaryColorDark: Color(0xff2b7600),
        accentColor: Color(0xfff9fbfb),
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
    );
  }
}