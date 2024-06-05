import 'package:flutter/material.dart';

void main() => runApp(DiseasePredictionApp());

class DiseasePredictionApp extends StatelessWidget {
  DiseasePredictionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DiseasePrediction(),
      ),
    );
  }
}

//****************************************************TELA HOME *********************************************************************** */

class DiseasePrediction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) {return Login();}),
          //   );
          // },
          child: Image.asset('imagens/Image.jpeg'),
        ),
        
      ),
    );
  }
}