import 'dart:convert' as convert;
import 'package:avc_form/pages/form_disease.dart';
import 'package:flutter/material.dart';
import 'package:avc_form/app_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;



class DiseasePrediction {
  final String name;
  final String cpf;
  final String dtnascimento;
  final double glucose;
  final double cholesterol;
  final double hemoglobin;
  final double platelets;
  final double white_blood_cells;
  final double red_blood_cells;
  final double hematocrit;
  final double mean_corpuscular_volume;
  final double mean_corpuscular_hemoglobin;
  final double mean_corpuscular_hemoglobin_concentration;
  final double insulin;
  final double bmi;
  final double systolic_blood_pressure;
  final double diastolic_blood_pressure;
  final double triglycerides;
  final double hba1c;
  final double ldl_cholesterol;
  final double hdl_cholesterol;
  final double alt;
  final double ast;
  final double heart_rate;
  final double creatinine;
  final double troponin;
  final double c_reactive_protein;
  final int disease;

  DiseasePrediction( {
    required this.name,
    required this.cpf,
    required this.dtnascimento,
    required this.glucose,
    required this.cholesterol,
    required this.hemoglobin,
    required this.platelets,
    required this.white_blood_cells,
    required this.red_blood_cells,
    required this.hematocrit,
    required this.mean_corpuscular_volume,
    required this.mean_corpuscular_hemoglobin,
    required this.mean_corpuscular_hemoglobin_concentration,
    required this.insulin,
    required this.bmi,
    required this.systolic_blood_pressure,
    required this.diastolic_blood_pressure,
    required this.triglycerides,
    required this.hba1c,
    required this.ldl_cholesterol,
    required this.hdl_cholesterol,
    required this.alt,
    required this.ast,
    required this.heart_rate,
    required this.creatinine,
    required this.troponin,
    required this.c_reactive_protein,
    required this.disease, required id,
  });

  factory DiseasePrediction.fromJson(Map<String, dynamic> json) {
    return DiseasePrediction(
      name: json['name'],
      cpf: json['cpf'],
      dtnascimento: json['dtnascimento'],
      glucose: json['glucose'].toDouble(),
      cholesterol: json['cholesterol'].toDouble(),
      hemoglobin: json['hemoglobin'].toDouble(),
      platelets: json['platelets'].toDouble(),
      white_blood_cells: json['white_blood_cells'].toDouble(),
      red_blood_cells: json['red_blood_cells'].toDouble(),
      hematocrit: json['hematocrit'].toDouble(),
      mean_corpuscular_volume: json['mean_corpuscular_volume'].toDouble(),
      mean_corpuscular_hemoglobin: json['mean_corpuscular_hemoglobin'].toDouble(),
      mean_corpuscular_hemoglobin_concentration: json['mean_corpuscular_hemoglobin_concentration'].toDouble(),
      insulin: json['insulin'].toDouble(),
      bmi: json['bmi'].toDouble(),
      systolic_blood_pressure: json['systolic_blood_pressure'].toDouble(),
      diastolic_blood_pressure: json['diastolic_blood_pressure'].toDouble(),
      triglycerides: json['triglycerides'].toDouble(),
      hba1c: json['hba1c'].toDouble(),
      ldl_cholesterol: json['ldl_cholesterol'].toDouble(),
      hdl_cholesterol: json['hdl_cholesterol'].toDouble(),
      alt: json['alt'].toDouble(),
      ast: json['ast'].toDouble(),
      heart_rate: json['heart_rate'].toDouble(),
      creatinine: json['creatinine'].toDouble(),
      troponin: json['troponin'].toDouble(),
      c_reactive_protein: json['c_reactive_protein'].toDouble(),
      disease: json['disease'], id: null,
    );
  }
}


  
  
class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String dbPath = await _getDatabasePath();
    return openDatabase(
      dbPath,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE diseasepredictions('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'cpf TEXT, '
          'dtnascimento TEXT, '
          'glucose REAL, '
          'cholesterol REAL, '
          'hemoglobin REAL, '
          'platelets REAL, '
          'white_blood_cells REAL, '
          'red_blood_cells REAL, '
          'hematocrit REAL, '
          'mean_corpuscular_volume REAL, '
          'mean_corpuscular_hemoglobin REAL, '
          'mean_corpuscular_hemoglobin_concentration REAL, '
          'insulin REAL, '
          'bmi REAL, '
          'systolic_blood_pressure REAL, '
          'diastolic_blood_pressure REAL, '
          'triglycerides REAL, '
          'hba1c REAL, '
          'ldl_cholesterol REAL, '
          'hdl_cholesterol REAL, '
          'alt REAL, '
          'ast REAL, '
          'heart_rate REAL, '
          'creatinine REAL, '
          'troponin REAL, '
          'c_reactive_protein REAL, '
          'disease INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<String> _getDatabasePath() async {
    String databasesPath = await getDatabasesPath();
    String path = '$databasesPath/auras.db';
    return path;
  }

  Future<List<Map<String, dynamic>>> _query(String table) async {
    Database db = await instance.database;
    return db.query(table);
  }

  Future<List<Map<String, dynamic>>> _queryById(String table, int id) async {
    Database db = await instance.database;
    return db.query(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return db.insert(table, row);
  }

  Future<int> update(String table, Map<String, dynamic> row, int id) async {
    Database db = await instance.database;
    return db.update(table, row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(String table, int id) async {
    Database db = await instance.database;
    return db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

 Future<List<DiseasePrediction>> findAll() async {
  Database db = await instance.database;
  List<Map<String, dynamic>> maps = await db.query('diseasepredictions');
  return List.generate(maps.length, (index) {
    return DiseasePrediction(
      id: maps[index]['id'],
      name: maps[index]['name'],
      cpf: maps[index]['cpf'],
      dtnascimento: maps[index]['dtnascimento'],
      glucose: maps[index]['glucose'],
      cholesterol: maps[index]['cholesterol'],
      hemoglobin: maps[index]['hemoglobin'],
      platelets: maps[index]['platelets'],
      white_blood_cells: maps[index]['white_blood_cells'],
      red_blood_cells: maps[index]['red_blood_cells'],
      hematocrit: maps[index]['hematocrit'],
      mean_corpuscular_volume: maps[index]['mean_corpuscular_volume'],
      mean_corpuscular_hemoglobin: maps[index]['mean_corpuscular_hemoglobin'],
      mean_corpuscular_hemoglobin_concentration: maps[index]['mean_corpuscular_hemoglobin_concentration'],
      insulin: maps[index]['insulin'],
      bmi: maps[index]['bmi'],
      systolic_blood_pressure: maps[index]['systolic_blood_pressure'],
      diastolic_blood_pressure: maps[index]['diastolic_blood_pressure'],
      triglycerides: maps[index]['triglycerides'],
      hba1c: maps[index]['hba1c'],
      ldl_cholesterol: maps[index]['ldl_cholesterol'],
      hdl_cholesterol: maps[index]['hdl_cholesterol'],
      alt: maps[index]['alt'],
      ast: maps[index]['ast'],
      heart_rate: maps[index]['heart_rate'],
      creatinine: maps[index]['creatinine'],
      troponin: maps[index]['troponin'],
      c_reactive_protein: maps[index]['c_reactive_protein'],
      disease: maps[index]['disease'],
    );
  });
}
}

class DiseaseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Diagnósticos',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(11,143,172,1.0),
      ),
      home: DiseaseListScreen(),
    );
  }
}



class DiseaseListScreen extends StatefulWidget {
  @override
  _DiseaseListScreenState createState() => _DiseaseListScreenState();
}

class _DiseaseListScreenState extends State<DiseaseListScreen> {
  late List<DiseasePrediction> diseases = [];

  @override
  void initState() {
    super.initState();
    fetchDiseases();
  }

  void fetchDiseases() async {
    print("Carregando diagnósticos...");
    List<DiseasePrediction> diseasesCarregados = await DatabaseHelper.instance.findAll();
    setState(() {
      diseases = diseasesCarregados;
    });
    print("Diagnósticos carregados: ${diseases.length}");
  }

  Widget buildDiseaseCard(DiseasePrediction disease) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        title: Text(disease.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("CPF: ${disease.cpf}"),
            Text("Data de nascimento: ${disease.dtnascimento}"),
            Text("Descrição da doença: ${disease.disease}"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 143, 172, 1.0),
        title: Text(
          'Diagnósticos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open Sans',
          ),
        ),
      ),
      body: diseases.isNotEmpty
          ? ListView.builder(
              itemCount: diseases.length,
              itemBuilder: (context, index) {
                return buildDiseaseCard(diseases[index]);
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

Widget buildPatientCard({
  required IconData profileIcon,
  required String name,
  required String cpf,
  required String dtnascimento,
  required String diseaseDescricao

}) {
  return Card(
      margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
      elevation: 8.0,
      borderOnForeground: true,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(97, 105, 245, 1),
              Color.fromRGBO(63, 72, 248, 0.6),
            ], // Defina as cores do seu gradiente
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Profile Icon
              Icon(
                profileIcon,
                size: 60.0,
                color: Colors.white,
              ),
              const SizedBox(width: 16.0),
              // Patient Information
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'Cpf: $cpf',
                    style: const TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  Text(
                    'Data de Nasicmento: $dtnascimento',
                    style: const TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  Text(
                    'stroke' == 'Stroke'
                        ? 'Tem pré disposição'
                        : 'Não tem pré disposição',
                    style: const TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ));
}