import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            onPressed: () {},
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.person_outlined,
              size: 120.0,
              color: Colors.grey[600],
            ),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso em (Kg)',
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura em (cm)',
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.0),
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Calcular',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            const Text(
              'Seu IMC é: 80',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
