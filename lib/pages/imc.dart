import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController imcWidthController = TextEditingController();
  final TextEditingController imcHeightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String text = 'Informe seus dados';
  double imc = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculadora IMC',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: refresh,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.person_outlined,
                  size: 120.0,
                  color: Colors.grey[600],
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira seu peso";
                    }
                  },
                  controller: imcWidthController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Peso em (Kg):',
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20.0),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira sua altura";
                    }
                  },
                  controller: imcHeightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Altura em (cm):',
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20.0),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30.0),
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        imcCalculator();
                      }
                    },
                    child: const Text(
                      'Calcular',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  imcCalculator() {
    setState(
      () {
        double peso = double.parse(imcWidthController.text);
        double altura = double.parse(imcHeightController.text) / 100;

        if ((altura != 0) && (peso != 0)) {
          imc = peso / (altura * altura);

          if (imc < 18.5) {
            text = 'IMC: ${imc.toStringAsFixed(2)}. Baixo peso';
          } else if ((imc > 18.5) && (imc <= 24.9)) {
            text = 'IMC: ${imc.toStringAsFixed(2)}. Eutrofia (peso adequado)';
          } else if ((imc > 25) && (imc <= 29.9)) {
            text = 'IMC: ${imc.toStringAsFixed(2)}. Sobrepeso';
          } else if ((imc > 30) && (imc <= 34.9)) {
            text = 'IMC: ${imc.toStringAsFixed(2)}. Obesidade 1º';
          } else if ((imc > 35) && (imc <= 39.9)) {
            text = 'IMC: ${imc.toStringAsFixed(2)}. Obesidade 2º';
          } else if (imc > 40) {
            text = 'IMC: ${imc.toStringAsFixed(2)}. Obesidade extrema';
          }
        }
        FocusScope.of(context).unfocus();
      },
    );
  }

  refresh() {
    imcHeightController.clear();
    imcWidthController.clear();
    setState(() {
      text = 'Informe seus dados';
      _formKey = GlobalKey<FormState>();
    });
  }
}
