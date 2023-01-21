import 'package:flutter/material.dart';
import 'pages/input_page.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      initialRoute: 'main',
      routes: {
        'main': (context) => InputPage(),
        'results': (context) => ResultsPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0XFF16193D),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: Color(0XFF16193D)),
      ),
      home: InputPage(),
    );
  }
}
