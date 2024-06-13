import 'dart:ffi';
import 'package:avc_form/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FormDiseasePage(),
    );
  }
}

class FormDiseasePage extends StatefulWidget {
  const FormDiseasePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormDiseasePageState createState() => _FormDiseasePageState();
}

class _FormDiseasePageState extends State<FormDiseasePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController controllername = TextEditingController();
  final TextEditingController controllercpf = TextEditingController();
  final TextEditingController controllerdtnascimento = TextEditingController();
  final TextEditingController controllerglucose = TextEditingController();
  final TextEditingController controllercholesterol = TextEditingController();
  final TextEditingController controllerhemoglobin = TextEditingController();
  final TextEditingController controllerplatelets = TextEditingController();
  final TextEditingController controllerwhite_blood_cells = TextEditingController();
  final TextEditingController controllerred_blood_cells = TextEditingController();
  final TextEditingController controllerhematocrit = TextEditingController();
  final TextEditingController controllermean_corpuscular_volume = TextEditingController();
  final TextEditingController controllermean_corpuscular_hemoglobin = TextEditingController();
  final TextEditingController controllermean_corpuscular_hemoglobin_concentration = TextEditingController();
  final TextEditingController controllerinsulin = TextEditingController();
  final TextEditingController controllerbmi = TextEditingController();
  final TextEditingController controllersystolic_blood_pressure = TextEditingController();
  final TextEditingController controllerdiastolic_blood_pressure = TextEditingController();
  final TextEditingController controllertriglycerides = TextEditingController();
  final TextEditingController controllerhba1c = TextEditingController();
  final TextEditingController controllerldl_cholesterol = TextEditingController();
  final TextEditingController controllerhdl_cholesterol = TextEditingController();
  final TextEditingController controlleralt = TextEditingController();
  final TextEditingController controllerast = TextEditingController();
  final TextEditingController controllerheart_rate = TextEditingController();
  final TextEditingController controllercreatinine = TextEditingController();
  final TextEditingController controllertroponin = TextEditingController();
  final TextEditingController controllerc_reactive_protein = TextEditingController();

  String _mesagem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11,143,172,1.0),
        title: Text(
          'Formulario Diagnóstico',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open Sans'
          ),
        )
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(11,143,172,1.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                controller: controllername,
                decoration: InputDecoration(
                  labelText: 'Nome do Paciente',
                  border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nome é obrigatório';
                      }
                      return null;
                },
                ),
                TextFormField(
                  controller: controllercpf,
                  decoration: InputDecoration(
                    labelText: 'Cpf',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Cpf é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerdtnascimento,
                  decoration: InputDecoration(
                    labelText: 'Data Nascimento',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Data Nascimento é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerglucose,
                  decoration: InputDecoration(
                    labelText: 'Glucose',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Glucose é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllercholesterol,
                  decoration: InputDecoration(
                    labelText: 'Colesterol',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Colesterol é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerhemoglobin,
                  decoration: InputDecoration(
                    labelText: 'Hemoglobina',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Hemoglobina é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerplatelets,
                  decoration: InputDecoration(
                    labelText: 'Plaquetas',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Plaquetas é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerwhite_blood_cells,
                  decoration: InputDecoration(
                    labelText: 'Células de Sangue Branco',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Células de Sangue Branco é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerred_blood_cells,
                  decoration: InputDecoration(
                    labelText: 'Glóbulos Vermelhos',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Glóbulos Vermelhos é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerhematocrit,
                  decoration: InputDecoration(
                    labelText: 'Hematócrito',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Hematócrito é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllermean_corpuscular_volume,
                  decoration: InputDecoration(
                    labelText: 'Volume Corpuscular Médio',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Volume Corpuscular Médio é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllermean_corpuscular_hemoglobin,
                  decoration: InputDecoration(
                    labelText: 'Hemoglobina Corpuscular Média',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Hemoglobina Corpuscular Média é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllermean_corpuscular_hemoglobin_concentration,
                  decoration: InputDecoration(
                    labelText: 'Concentração Média de Hemoglobina Corpuscular',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Concentração Média de Hemoglobina Corpuscular é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerinsulin,
                  decoration: InputDecoration(
                    labelText: 'Insulina',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insulina é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerbmi,
                  decoration: InputDecoration(
                    labelText: 'IMC',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'IMC é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllersystolic_blood_pressure,
                  decoration: InputDecoration(
                    labelText: 'Pressão Arterial Sistólica (PAS)',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Pressão Arterial Sistólica (PAS) é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerdiastolic_blood_pressure,
                  decoration: InputDecoration(
                    labelText: 'Pressão Sanguínea Diastólica (PAD)',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Pressão Sanguínea Diastólica (PAD) é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllertriglycerides,
                  decoration: InputDecoration(
                    labelText: 'Triglicerídeos',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Triglicerídeos é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerhba1c,
                  decoration: InputDecoration(
                    labelText: 'Hemoglobina Glicada (HbA1c)',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Hemoglobina Glicada (HbA1c) é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerldl_cholesterol,
                  decoration: InputDecoration(
                    labelText: 'Colesterol LDL',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Colesterol LDL é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerhdl_cholesterol,
                  decoration: InputDecoration(
                    labelText: 'Colesterol HDL',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Colesterol HDL é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controlleralt,
                  decoration: InputDecoration(
                    labelText: 'Alanina Aminotransferase (ALT)',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Alanina Aminotransferase (ALT) é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerast,
                  decoration: InputDecoration(
                    labelText: 'Aspartato Aminotransferase (AST)',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Aspartato Aminotransferase (AST) é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerheart_rate,
                  decoration: InputDecoration(
                    labelText: 'Frequência cardíaca',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Frequência cardíaca é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllercreatinine,
                  decoration: InputDecoration(
                    labelText: 'Creatinina',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Creatinina é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllertroponin,
                  decoration: InputDecoration(
                    labelText: 'Troponina',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Troponina é obrigatório';
                        }
                        return null;
                  },
                ),
                TextFormField(
                  controller: controllerc_reactive_protein,
                  decoration: InputDecoration(
                    labelText: 'Proteína C Reativa (PCR)',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Proteína C Reativa (PCR) é obrigatório';
                        }
                        return null;
                  },
                ),
                GestureDetector(
                  onTap: () {
                    // Navegar para a tela "Histórico de pacientes"
                    if (_formKey.currentState!.validate()) {
                      // sendDataToApi();
                      postData();
                    }
                  },
                child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width - 30,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(97, 105, 245, 1),
                        Color.fromRGBO(63, 72, 248, 0.6),
                      ]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "EVIAR FORMULARIO",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future postData() async {
    Uri url = Uri.parse('http://488e3bd6-9441-4bc4-866b-d18912e8702f.eastus2.azurecontainer.io/score');

    final Map<String, dynamic> data = {
      'glucose': controllerglucose,
      'cholesterol': controllercholesterol,
      'hemoglobin': controllerhemoglobin,
      'platelets': controllerplatelets,
      'white_blood_cells': controllerwhite_blood_cells,
      'red_blood_cells': controllerred_blood_cells,
      'hematocrit': controllerhematocrit,
      'mean_corpuscular_volume': controllermean_corpuscular_volume,
      'mean_corpuscular_hemoglobin': controllermean_corpuscular_hemoglobin,
      'mean_corpuscular_hemoglobin_concentration': controllermean_corpuscular_hemoglobin_concentration,
      'insulin': controllerinsulin,
      'bmi': controllerbmi,
      'systolic_blood_pressure': controllersystolic_blood_pressure,
      'diastolic_blood_pressure': controllerdiastolic_blood_pressure,
      'triglycerides': controllertriglycerides,
      'hba1c': controllerhba1c,
      'ldl_cholesterol': controllerldl_cholesterol,
      'hdl_cholesterol': controllerhdl_cholesterol,
      'alt': controlleralt,
      'heart_rate': controllerheart_rate,
      'creatinine': controllercreatinine,
      'troponin': controllertroponin,
      'c_reactive_protein': controllerc_reactive_protein,
    };

    String requestBody = convert.jsonEncode(data);

    if (kDebugMode) {
      print(requestBody);
    }

    try {
      final response = await http.post(
        url,
        body: requestBody,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final teste = convert.jsonDecode(response.body);

        if (teste == 1) {
          var _fullNameController;
          _mesagem =
              'O Paciente ${_fullNameController.text} apresenta Anemia.';
          _exibirAlerta(context);
        } 
        if (teste == 2) {
          var _fullNameController;
          _mesagem =
              'O Paciente ${_fullNameController.text} Saudável.';
          _exibirAlerta(context);
        } 
        if (teste == 3) {
          var _fullNameController;
          _mesagem =
              'O Paciente ${_fullNameController.text} apresenta Diabetes.';
          _exibirAlerta(context);
        } 
        if (teste == 4) {
          var _fullNameController;
          _mesagem =
              'O Paciente ${_fullNameController.text} apresenta Thalasse.';
          _exibirAlerta(context);
        } 
        if (teste == 5) {
          var _fullNameController;
          _mesagem =
              'O Paciente ${_fullNameController.text} apresenta Trombose.';
          _exibirAlerta(context);
        } 
      }
    } catch (e) {
      print('Erro na requisição POST: $e');
    }
  }

  void _exibirAlerta(BuildContext context) {
    const msg = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Paciente cadastrado com sucesso!'),
          content: Text(_mesagem),
          actions: [
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/home");
              },
              child: Text('OK'),
              backgroundColor: Color.fromRGBO(97, 105, 245, 1),
            ),
          ],
        );
      },
    );
  }
}



class SelectOption {
  final String value;
  final String label;

  const SelectOption(this.value, this.label);
}
