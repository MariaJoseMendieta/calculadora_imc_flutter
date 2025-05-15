import 'package:flutter/material.dart';
import 'screens/input_page.dart'; //Importa la pantalla principal

//Función principal que se ejecuta al iniciar la app
void main() {
  runApp(const BMICalculator()); //Punto de entrada de la app
}

//Widget sin estado que representa la aplicación completa
class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        //Configura el color del AppBar y del fondo general
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1F0018),
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Color(0xFF1F0018),
      ),
      home: InputPage(), //Pantalla principal de la app
    );
  }
}
