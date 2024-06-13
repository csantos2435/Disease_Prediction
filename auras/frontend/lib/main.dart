import 'package:avc_form/pages/form_disease.dart';
import 'package:avc_form/pages/home.dart';
import 'package:avc_form/pages/list_disease.dart';
import 'package:avc_form/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DiseasePredictionApp());
}

class DiseasePredictionApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
      '/': (context) => LoginPage(),
      '/home': (context) => const HomePage(),
      '/form_disease': (context) => const FormPage(),
      '/list_disease': (context) => DiseaseList(),
      },
    );
  }
}