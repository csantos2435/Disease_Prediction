import 'package:avc_form/main.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DiseasePrediction {
  final int? id;
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

  DiseasePrediction(
    this.id,
    this.name,
    this.cpf,
    this.dtnascimento,
    this.glucose,
    this.cholesterol,
    this.hemoglobin,
    this.platelets,
    this.white_blood_cells,
    this.red_blood_cells,
    this.hematocrit,
    this.mean_corpuscular_volume,
    this.mean_corpuscular_hemoglobin,
    this.mean_corpuscular_hemoglobin_concentration,
    this.insulin,
    this.bmi,
    this.systolic_blood_pressure,
    this.diastolic_blood_pressure,
    this.triglycerides,
    this.hba1c,
    this.ldl_cholesterol,
    this.hdl_cholesterol,
    this.alt,
    this.ast,
    this.heart_rate,
    this.creatinine,
    this.troponin,
    this.c_reactive_protein,
    this.disease,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cpf': cpf,
      'dtnascimento': dtnascimento,
      'glucose': glucose,
      'cholesterol': cholesterol,
      'hemoglobin': hemoglobin,
      'platelets': platelets,
      'white_blood_cells': white_blood_cells,
      'red_blood_cells': red_blood_cells,
      'hematocrit': hematocrit,
      'mean_corpuscular_volume': mean_corpuscular_volume,
      'mean_corpuscular_hemoglobin': mean_corpuscular_hemoglobin,
      'mean_corpuscular_hemoglobin_concentration': mean_corpuscular_hemoglobin_concentration,
      'insulin': insulin,
      'bmi': bmi,
      'systolic_blood_pressure': systolic_blood_pressure,
      'diastolic_blood_pressure': diastolic_blood_pressure,
      'triglycerides': triglycerides,
      'hba1c': hba1c,
      'ldl_cholesterol': ldl_cholesterol,
      'hdl_cholesterol': hdl_cholesterol,
      'alt': alt,
      'ast': ast,
      'heart_rate': heart_rate,
      'creatinine': creatinine,
      'troponin': troponin,
      'c_reactive_protein': c_reactive_protein,
      'disease': disease,
    };
  }
}

class Usuario {
  final int id;
  final String user;
  final String cpfUser;
  final String email;
  final String funcao;
  final String password;
  final String passwordChecks;

  Usuario(
    this.id,
    this.user,
    this.cpfUser,
    this.email,
    this.funcao,
    this.password,
    this.passwordChecks,
  );
}




// CREATE DATABASE
Future<Database> createDatabase() {
  
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(
        dbPath,
        'auras.db',
      );
      return openDatabase(
        path,
        onCreate: (db, version) {
          db.execute('CREATE TABLE diseasepredictions('
                'id INTEGER PRIMARY KEY, '
                'name TEXT, '
                'cpf TEXT, '
                'dtnascimento TEXT, '
                'glucose DECIMAL, '
                'cholesterol DECIMAL, '
                'hemoglobin DECIMAL, '
                'platelets DECIMAL, '
                'white_blood_cells DECIMAL, '
                'red_blood_cells DECIMAL, '
                'hematocrit DECIMAL, '
                'mean_corpuscular_volume DECIMAL, '
                'mean_corpuscular_hemoglobin DECIMAL, '
                'mean_corpuscular_hemoglobin_concentration DECIMAL, '
                'insulin DECIMAL, '
                'bmi DECIMAL, '
                'systolic_blood_pressure DECIMAL, '
                'diastolic_blood_pressure DECIMAL, '
                'triglycerides DECIMAL, '
                'hba1c DECIMAL, '
                'ldl_cholesterol DECIMAL, '
                'hdl_cholesterol DECIMAL, '
                'alt DECIMAL, '
                'ast DECIMAL, '
                'heart_rate DECIMAL, '
                'creatinine DECIMAL, '
                'troponin DECIMAL, '
                'c_reactive_protein DECIMAL, '
                'disease INTEGER)');
        },
        version: 1,
      );
    },
  );
}

//\\//\\//\\//\\//\\//\\//\\ DISEASE PREDICTION //\\//\\//\\//\\//\\//\\//\\

// POST
Future<int> saveDisease(DiseasePrediction diseaseprediction) {
  return createDatabase().then(
    (db) {
      final Map<String, dynamic> diseasepredictionMap = {};
        diseasepredictionMap['name'] = diseaseprediction.name ;
        diseasepredictionMap['cpf'] = diseaseprediction.cpf ;
        diseasepredictionMap['dtnascimento'] = diseaseprediction.dtnascimento ;
        diseasepredictionMap['glucose'] = diseaseprediction.glucose ;
        diseasepredictionMap['cholesterol'] = diseaseprediction.cholesterol ;
        diseasepredictionMap['hemoglobin'] = diseaseprediction.hemoglobin ;
        diseasepredictionMap['platelets'] = diseaseprediction.platelets ;
        diseasepredictionMap['white_blood_cells'] = diseaseprediction.white_blood_cells ;
        diseasepredictionMap['red_blood_cells'] = diseaseprediction.red_blood_cells ;
        diseasepredictionMap['hematocrit'] = diseaseprediction.hematocrit ;
        diseasepredictionMap['mean_corpuscular_volume'] = diseaseprediction.mean_corpuscular_volume ;
        diseasepredictionMap['mean_corpuscular_hemoglobin'] = diseaseprediction.mean_corpuscular_hemoglobin ;
        diseasepredictionMap['mean_corpuscular_hemoglobin_concentration'] = diseaseprediction.mean_corpuscular_hemoglobin_concentration ;
        diseasepredictionMap['insulin'] = diseaseprediction.insulin ;
        diseasepredictionMap['bmi'] = diseaseprediction.bmi ;
        diseasepredictionMap['systolic_blood_pressure'] = diseaseprediction.systolic_blood_pressure ;
        diseasepredictionMap['diastolic_blood_pressure'] = diseaseprediction.diastolic_blood_pressure ;
        diseasepredictionMap['triglycerides'] = diseaseprediction.triglycerides ;
        diseasepredictionMap['hba1c'] = diseaseprediction.hba1c ;
        diseasepredictionMap['ldl_cholesterol'] = diseaseprediction.ldl_cholesterol ;
        diseasepredictionMap['hdl_cholesterol'] = diseaseprediction.hdl_cholesterol ;
        diseasepredictionMap['alt'] = diseaseprediction.alt ;
        diseasepredictionMap['ast'] = diseaseprediction.ast ;
        diseasepredictionMap['heart_rate'] = diseaseprediction.heart_rate ;
        diseasepredictionMap['creatinine'] = diseaseprediction.creatinine ;
        diseasepredictionMap['troponin'] = diseaseprediction.troponin ;
        diseasepredictionMap['c_reactive_protein'] = diseaseprediction.c_reactive_protein ;
        diseasepredictionMap['disease'] = diseaseprediction.disease ;
      return db.insert('diseasepredictions', diseasepredictionMap);
    },
  );
}

// GET
Future<List<DiseasePrediction>> findAllDisease() {
  return createDatabase().then(
    (db) {
      return db.query('diseasepredictions').then(
        (maps) {
          final List<DiseasePrediction> diseasepredictions = [];
          for (Map<String, dynamic> map in maps) {
            final DiseasePrediction diseaseprediction = DiseasePrediction(
                map['id'],
                map['name'],
                map['cpf'],
                map['dtnascimento'],
                map['glucose'],
                map['cholesterol'],
                map['hemoglobin'],
                map['platelets'],
                map['white_blood_cells'],
                map['red_blood_cells'],
                map['hematocrit'],
                map['mean_corpuscular_volume'],
                map['mean_corpuscular_hemoglobin'],
                map['mean_corpuscular_hemoglobin_concentration'],
                map['insulin'],
                map['bmi'],
                map['systolic_blood_pressure'],
                map['diastolic_blood_pressure'],
                map['triglycerides'],
                map['hba1c'],
                map['ldl_cholesterol'],
                map['hdl_cholesterol'],
                map['alt'],
                map['ast'],
                map['heart_rate'],
                map['creatinine'],
                map['troponin'],
                map['c_reactive_protein'],
                map['disease'],
            );
            diseasepredictions.add(diseaseprediction);
          }
          return diseasepredictions;
        },
      );
    },
  );
}

// GET ID
Future<Usuario?> findByIdUser(String email) {
  return createDatabase().then(
    (db) {
      return db.query('usuarios', where: 'email = ?', whereArgs: [email]).then(
        (maps) {
          if (maps.isNotEmpty) {
            final Map<String, dynamic> map = maps.first;
            final Usuario usuario = Usuario(
              map['id'],
              map['user'],
              map['cpfUser'],
              map['email'],
              map['funcao'],
              map['password'],
              map['passwordChecks'],
            );
            return usuario;
          } else {
            return null; // Retorna null se não encontrar nenhum usuário com o ID fornecido
          }
        },
      );
    },
  );
}

