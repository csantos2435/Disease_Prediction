import 'package:flutter/material.dart';
import 'package:bank/app_database.dart';
import 'package:flutter/widgets.dart';


void main() {
  runApp(DiseasePredictionApp());
  
   findAll().then((diseasepredictions) => debugPrint(diseasepredictions.toString()));
}

class DiseasePredictionApp extends StatelessWidget {
  DiseasePredictionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiseasePrediction(),
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Login();
              }),
            );
          },
          child: <Widget>[
            new Image.asset(
              'imagens/Image.jpeg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}

//**************************************************** TELA LOGIN *********************************************************************** */

// class ListaContatos extends StatelessWidget {
//   const ListaContatos({super.key});

// } 

class Login extends StatefulWidget {
  Login({super.key});

  final List<Login> _login = [];
  
  @override
  State<StatefulWidget> createState() {
    //return LoginState();
  }
}

