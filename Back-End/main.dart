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
      appBar: AppBar(//Sem APP BAR),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {return Login();}),
            );
          },
          child: Image.network(
            //Imagem da LOGO,
          ),
        ),
      ),
    );
  }
}

//**************************************************** TELA LOGIN *********************************************************************** */

class Login extends StatefulWidget {

  Login({super.key});
  final List<Login> _login = [];
  
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  bool isEntrando = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
              ),
              if (!isEntrando)
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe  seu nome';
                    }
                    return null;
                  },
                ),
              ElevatedButton(
                child: Text('Login'),
                onPressed: () {
                  Entrar(
                    context,
                    _email,
                    _senha,
                    _nome,
                  );
                },
              ),
              TextButton(
                onPressed: () {
                    final Future<CadastroUsuario?> future = Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) {
                        return FormularioCadastroUsuario();
                    },
                    ),
                    );
                    future.then(
                        (cadastroRecebido) {
                        debugPrint('chegou no then do future');
                        debugPrint('$cadastroRecebido');
                        if (cadastroRecebido != null) {
                            setState(() {
                            widget._login.add(cadastroRecebido);
                            });
                        }
                    },
                );
                },
                child: Text(isEntrando ? 'Criar Conta' : 'Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Entrar(
    BuildContext context,
    _controllerEmail,
    _controllerSenha,
    _controllerNome,
    ) {
    final _email = _controllerEmail.text;
    final _senha = _controllerSenha.text;
    final _nome = _controllerNome.text;

    if (_email.isNotEmpty && _senha.isNotEmpty && _nome.isNotEmpty &&) {
        if (_formKey.currentState!.validate()) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => {
                return ListDiseasePrediction();
            }),);
        }
    }
  }

   void CadastrarUser(
    BuildContext context,
    _controllerEmail,
    _controllerNome,
    ) {
    final _email = _controllerEmail.text;
    final _nome = _controllerNome.text;

    if (_email.isNotEmpty && _nome.isNotEmpty &&) {
        
            Navigator.push(context, MaterialPageRoute(builder: (context) => {
                return ListDiseasePrediction();
            }),);
    }
  }   
}



//**************************************************** TELA CADASTRO USUÁRIO *********************************************************************** */

class CadastroUsuario {
  final String user;
  final String cpfUser;
  final String email;
  final String funcao;
  final String password;
  final String passwordChecks;

  CadastroUsuario(this.user, this.cpfUser, this.email, this.funcao, this.password, this.passwordChecks);

  @override
  String toString() {
    return 'CadastroUsuario{user: $user, cpfUser: $cpfUser, email: $email, funcao: $funcao, password: $password, passwordChecks: $passwordChecks}';
  }
}

class FormularioCadastroUsuario extends StatelessWidget {

  final TextEditingController controllerUser = TextEditingController();
  final TextEditingController controllerCpfUser = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerFuncao = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerPasswordChecks = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x0B8FAC),
        title: Text(
          'Cadastro Usuário',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open Sans'
          ),
        ),
      ),
      body: Column(
        children: [
          CadastroEditor(
            label: 'Nome', 
            dica: 'Nome usuário',
            controller: controllerUser
            ),
          CadastroEditor(
            label: 'CPF', 
            dica: '000.000.000-00',
            controller: controllerCpfUser
            ),
          CadastroEditor(
            label: 'Email', 
            dica: 'xxxx@gmail.com',
            controller: controllerEmail
            ),
          CadastroEditor(
            label: 'Cargo/Função do Usuário', 
            dica: 'Médico',
            controller: controllerFuncao
          ),
          CadastroEditor(
            label: 'Senha', 
            dica: 'Infomre uma senha segura',
            controller: controllerPassword
            ),
          CadastroEditor(
            label: 'Confirmação de Senha', 
            dica: 'Confirme sua senha',
            controller: controllerPasswordChecks
            ),
          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: (){
                _criaCadastro(context,
                  controllerUser,
                  controllerCpfUser,
                  controllerEmail,
                  controllerFuncao,
                  controllerPassword,
                  controllerPasswordChecks
                );
              },  
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0x0B8FAC)),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ],
      ),

    );
  }
  void _criaCadastro(
    BuildContext context,
    TextEditingController controllerUser,
    TextEditingController controllerCpfUser,
    TextEditingController controllerEmail,
    TextEditingController controllerFuncao,
    TextEditingController controllerPassword,
    TextEditingController controllerPasswordChecks
  ) {
    final user = controllerUser.text;
    final cpfUser = controllerCpfUser.text;
    final email = controllerEmail.text;
    final funcao = controllerFuncao.text;
    final password = controllerPassword.text;
    final passwordChecks = controllerPasswordChecks.text;

    if (user.isNotEmpty && cpfUser.isNotEmpty && email.isNotEmpty && funcao.isNotEmpty && password.isNotEmpty && passwordChecks.isNotEmpty) {
      if(password == passwordChecks){
        final cadastroCriado = Cadastro(user, cpfUser, email, funcao, password, passwordChecks);
        debugPrint('$cadastroCriado');
        Navigator.pop(context, cadastroCriado);
      }else{
        return 'Confirmar senha está incorreto!';
      }
    }
  }
}

//**************************************************** TELA INICIAL *********************************************************************** */

class ListDiseasePrediction extends StatefulWidget {

  ListDiseasePrediction({super.key});
  final List<DiseasePrediction> _diseaseprediction = [];
  
  @override
  State<StatefulWidget> createState() {
    return ListDiseasePredictionState();
  }
}

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

  DiseasePrediction(this.name, this.cpf, this.dtnascimento, this.glucose, this.cholesterol, this.hemoglobin, 
                    this.platelets, this.white_blood_cells, this.red_blood_cells, this.hematocrit, this.mean_corpuscular_volume, 
                    this.mean_corpuscular_hemoglobin, this.mean_corpuscular_hemoglobin_concentration, this.insulin, this.bmi, 
                    this.systolic_blood_pressure, this.diastolic_blood_pressure, this.triglycerides, this.hba1c, this.ldl_cholesterol, 
                    this.hdl_cholesterol, this.alt, this.ast, this.heart_rate, this.creatinine, this.troponin, this.c_reactive_protein, this.disease);

  @override
  String toString() {
    return 'DiseasePrediction{name: $name, cpf: $cpf, dtnascimento: $dtnascimento, glucose: $glucose, cholesterol: $cholesterol, hemoglobin: $hemoglobin,
                                platelets: $platelets, white_blood_cells: $white_blood_cells, red_blood_cells: $red_blood_cells, hematocrit: $hematocrit,
                                mean_corpuscular_volume: $mean_corpuscular_volume, mean_corpuscular_hemoglobin: $mean_corpuscular_hemoglobin, 
                                mean_corpuscular_hemoglobin_concentration: $mean_corpuscular_hemoglobin_concentration, insulin: $insulin, bmi: $bmi,
                                systolic_blood_pressure: $systolic_blood_pressure, diastolic_blood_pressure: $diastolic_blood_pressure, triglycerides: $triglycerides
                                hba1c: $hba1c, ldl_cholesterol: $ldl_cholesterol, hdl_cholesterol: $hdl_cholesterol, alt: $alt, heart_rate: $heart_rate, 
                                creatinine: $creatinine, troponin: $troponin, c_reactive_protein, disease: $disease}';

  }
}

class ListDiseasePredictionState extends State<ListDiseasePrediction>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x0B8FAC),
        title: Text(
          'Diagnósticos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open Sans'
          ),
        
        ),
      ),
      body: ListView.builder(
        itemCount: widget._diseaseprediction.length,
        itemBuilder: (context, indice){
          final diseaseprediction = widget._diseaseprediction[indice];
          return ItemDiseaseprediction(diseaseprediction);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0x0B8FAC),
        onPressed: () {
          final Future<DiseasePrediction?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioDiseasePrediction();
              },
            ),
          );
          future.then(
            (diseasepredictionReceived) {
              debugPrint('chegou no then do future');
              debugPrint('$diseasepredictionReceived');
              if (diseasepredictionReceived != null) {
                setState(() {
                  widget._diseaseprediction.add(diseasepredictionReceived);
                });
              }
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ItemDiseaseprediction extends StatelessWidget {
  final DiseasePrediction _diseaseprediction;
  final String diseaseDescricao;

  ItemDiseaseprediction(this._diseaseprediction, {super.key});
  
  switch(_diseaseprediction.disease) {
    case 1:
      diseaseDescricao = 'Anemia';
      break;
    case 2:
      diseaseDescricao = 'Saudável';
      break;
    case 3:
      diseaseDescricao = 'Diabetes';
      break;
    case 4:
      diseaseDescricao = 'Thalasse';
      break;
    case 5:
      diseaseDescricao = 'Trombose';
      break;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on, color: Color(0xD2EBE7)),
        title: Text(_diseaseprediction.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_diseaseprediction.cpf),
            Text(_diseaseprediction.dtnascimento),
            Text(diseaseDescricao),
          ],
      ),
    );
  }
}


//**************************************************** TELA DE LANÇAMENTO DE DADOS *********************************************************************** */


class FormularioDiseasePrediction extends StatelessWidget {

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x0B8FAC),
        title: Text(
          'Nova Previsão',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open Sans',
          ),
        ),
      ),
      body: Column(
        children: [
          CadastroEditor(
            label: 'Nome Paciente', 
            dica: 'Nome completo',
            controller: controllername
            ),
          CadastroEditor(
            label: 'CPF', 
            dica: '000.000.000-00',
            controller: controllercpf
          ),
          CadastroEditor(
            label: 'Data Nascimento', 
            dica: '00/00/0000',
            controller: controllerdtnascimento
            ),
          CadastroEditor(
            label: 'Glucose', 
            dica: '0.00',
            controller: controllerglucose
            ),
          CadastroEditor(
            label: 'Colesterol', 
            dica: '0.00',
            controller: controllercholesterol
            ),
          CadastroEditor(
            label: 'Hemoglobina', 
            dica: '0.00',
            controller: controllerhemoglobin
            ),
          CadastroEditor(
            label: 'Plaquetas', 
            dica: '0.00',
            controller: controllerplatelets
            ),
          CadastroEditor(
            label: 'Células de Sangue Branco', 
            dica: '0.00',
            controller: controllerwhite_blood_cells
            ),
          CadastroEditor(
            label: 'Glóbulos Vermelhos', 
            dica: '0.00',
            controller: controllerred_blood_cells
            ),
          CadastroEditor(
            label: 'Hematócrito', 
            dica: '0.00',
            controller: controllerhematocrit
            ),
          CadastroEditor(
            label: 'Volume Corpuscular Médio', 
            dica: '0.00',
            controller: controllermean_corpuscular_volume
            ),
          CadastroEditor(
            label: 'Hemoglobina Corpuscular Média', 
            dica: '0.00',
            controller: controllermean_corpuscular_hemoglobin
            ),
          CadastroEditor(
            label: 'Concentração Média de Hemoglobina Corpuscular', 
            dica: '0.00',
            controller: controllermean_corpuscular_hemoglobin_concentration
            ),
          CadastroEditor(
            label: 'Insulina', 
            dica: '0.00',
            controller: controllerinsulin
            ),
          CadastroEditor(
            label: 'IMC', 
            dica: '0.00',
            controller: controllerbmi
            ),
          CadastroEditor(
            label: 'Pressão Arterial Sistólica (PAS)', 
            dica: '0.00',
            controller: controllersystolic_blood_pressure
            ),
          CadastroEditor(
            label: 'Pressão Sanguínea Diastólica (PAD)', 
            dica: '0.00',
            controller: controllerdiastolic_blood_pressure
            ),
          CadastroEditor(
            label: 'Triglicerídeos', 
            dica: '0.00',
            controller: controllertriglycerides
            ),
          CadastroEditor(
            label: 'Hemoglobina Glicada (HbA1c)', 
            dica: '0.00',
            controller: controllerhba1c
            ),
          CadastroEditor(
            label: 'Colesterol LDL', 
            dica: '0.00',
            controller: controllerldl_cholesterol
            ),
          CadastroEditor(
            label: 'Colesterol HDL', 
            dica: '0.00',
            controller: controllerhdl_cholesterol
            ),
          CadastroEditor(
            label: 'Alanina Aminotransferase (ALT)', 
            dica: '0.00',
            controller: controlleralt
            ),
          CadastroEditor(
            label: 'Aspartato Aminotransferase (AST)', 
            dica: '0.00',
            controller: controllerast
            ),
          CadastroEditor(
            label: 'Frequência cardíaca', 
            dica: '0.00',
            controller: controllerheart_rate
            ),
          CadastroEditor(
            label: 'Creatinina', 
            dica: '0.00',
            controller: controllercreatinine
            ),
          CadastroEditor(
            label: 'Troponina', 
            dica: '0.00',
            controller: controllertroponin
            ),
          CadastroEditor(
            label: 'Proteína C Reativa (PCR)', 
            dica: '0.00',
            controller: controllerc_reactive_protein
            ),

          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: (){
                _criaDiseasePrediction(context,
                  controllername,
                  controllercpf,
                  controllerdtnascimento,
                  controllerglucose,
                  controllercholesterol,
                  controllerhemoglobin,
                  controllerplatelets,
                  controllerwhite_blood_cells,
                  controllerred_blood_cells,
                  controllerhematocrit,
                  controllermean_corpuscular_volume,
                  controllermean_corpuscular_hemoglobin,
                  controllermean_corpuscular_hemoglobin_concentration,
                  controllerinsulin,
                  controllerbmi,
                  controllersystolic_blood_pressure,
                  controllerdiastolic_blood_pressure,
                  controllertriglycerides,
                  controllerhba1c,
                  controllerldl_cholesterol,
                  controllerhdl_cholesterol,
                  controlleralt,
                  controllerast,
                  controllerheart_rate,
                  controllercreatinine,
                  controllertroponin,
                  controllerc_reactive_protein
                );
              },  
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0x0B8FAC)),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ],
      ),

    );
  }
  void _criaDiseasePrediction(
    BuildContext context,
    TextEditingController controllername,
    TextEditingController controllercpf,
    TextEditingController controllerdtnascimento,
    TextEditingController controllerglucose,
    TextEditingController controllercholesterol,
    TextEditingController controllerhemoglobin,
    TextEditingController controllerplatelets,
    TextEditingController controllerwhite_blood_cells,
    TextEditingController controllerred_blood_cells,
    TextEditingController controllerhematocrit,
    TextEditingController controllermean_corpuscular_volume,
    TextEditingController controllermean_corpuscular_hemoglobin,
    TextEditingController controllermean_corpuscular_hemoglobin_concentration,
    TextEditingController controllerinsulin,
    TextEditingController controllerbmi,
    TextEditingController controllersystolic_blood_pressure,
    TextEditingController controllerdiastolic_blood_pressure,
    TextEditingController controllertriglycerides,
    TextEditingController controllerhba1c,
    TextEditingController controllerldl_cholesterol,
    TextEditingController controllerhdl_cholesterol,
    TextEditingController controlleralt,
    TextEditingController controllerast,
    TextEditingController controllerheart_rate,
    TextEditingController controllercreatinine,
    TextEditingController controllertroponin,
    TextEditingController controllerc_reactive_protein,
  ) {

    final name = controllername.text;
    final cpf = controllercpf.text;
    final dtnascimento = controllerdtnascimento.text;
    final double? glucose = double.tryParse(controllerglucose.text);
    final double? cholesterol = double.tryParse(controllercholesterol.text);
    final double? hemoglobin = double.tryParse(controllerhemoglobin.text);
    final double? platelets = double.tryParse(controllerplatelets.text);
    final double? white_blood_cells = double.tryParse(controllerwhite_blood_cells.text);
    final double? red_blood_cells = double.tryParse(controllerred_blood_cells.text);
    final double? hematocrit = double.tryParse(controllerhematocrit.text);
    final double? mean_corpuscular_volume = double.tryParse(controllermean_corpuscular_volume.text);
    final double? mean_corpuscular_hemoglobin = double.tryParse(controllermean_corpuscular_hemoglobin.text);
    final double? mean_corpuscular_hemoglobin_concentration = double.tryParse(controllermean_corpuscular_hemoglobin_concentration.text);
    final double? insulin = double.tryParse(controllerinsulin.text);
    final double? bmi = double.tryParse(controllerbmi.text);
    final double? systolic_blood_pressure = double.tryParse(controllersystolic_blood_pressure.text);
    final double? diastolic_blood_pressure = double.tryParse(controllerdiastolic_blood_pressure.text);
    final double? triglycerides = double.tryParse(controllertriglycerides.text);
    final double? hba1c = double.tryParse(controllerhba1c.text);
    final double? ldl_cholesterol = double.tryParse(controllerldl_cholesterol.text);
    final double? hdl_cholesterol = double.tryParse(controllerhdl_cholesterol.text);
    final double? alt = double.tryParse(controlleralt.text);
    final double? ast = double.tryParse(controllerast.text);
    final double? heart_rate = double.tryParse(controllerheart_rate.text);
    final double? creatinine = double.tryParse(controllercreatinine.text);
    final double? troponin = double.tryParse(controllertroponin.text);
    final double? c_reactive_protein = double.tryParse(controllerc_reactive_protein.text); 

    if (name.isNotEmpty && cpf.isNotEmpty && dtnascimento.isNotEmpty && glucose != null && cholesterol != null && hemoglobin != null && platelets != null 
        && white_blood_cells != null && red_blood_cells != null && hematocrit != null && mean_corpuscular_volume != null && mean_corpuscular_hemoglobin != null 
        && mean_corpuscular_hemoglobin_concentration != null && insulin != null && bmi != null && systolic_blood_pressure != null && diastolic_blood_pressure != null 
        && triglycerides != null && hba1c != null && ldl_cholesterol != null && hdl_cholesterol != null && alt != null && ast != null && heart_rate != null 
        && creatinine != null && troponin != null && c_reactive_protein != null) {
      
      final diseasepredictionCriada = DiseasePrediction(name, cpf, dtnascimento, glucose, cholesterol, hemoglobin, platelets, white_blood_cells, 
                                                        red_blood_cells, hematocrit, mean_corpuscular_volume, mean_corpuscular_hemoglobin, 
                                                        mean_corpuscular_hemoglobin_concentration, insulin, bmi, systolic_blood_pressure, 
                                                        diastolic_blood_pressure, triglycerides, hba1c, ldl_cholesterol, hdl_cholesterol, alt, ast, 
                                                        heart_rate, creatinine, troponin, c_reactive_protein);
      debugPrint('$diseasepredictionCriada');
      Navigator.pop(context, diseasepredictionCriada);
    }
  }
}

class CadastroEditor extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final String? dica;

  CadastroEditor({super.key, this.controller, this.dica, this.label}); 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        hintText: dica,
      ),
    );
  }
}
