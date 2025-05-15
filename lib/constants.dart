import 'package:flutter/material.dart';

//Constantes para colores y alturas

//Altura del contenedor inferior (botón grande)
const kBottomContainerHeight = 80.0;
//Color de fondo del botón inferior (CALCULAR y RE-CALCULAR)
const kBottomContainerColor = Color(0xFFafb42b);
//Color de las tarjetas activas (cuando están seleccionadas)
const kActiveCardColor = Color(0xFF4E4457);
//Color de las tarjetas inactivas (cuando no están seleccionadas)
const kInactiveCardColor = Color(0xFF2D0B3D);

//Estilo de texto reutilizable

//Estilo para etiquetas como "ALTURA", "PESO", "EDAD"
const kLabelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));
//Estilo para los números grandes que representan altura, peso, edad
const kNumberTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);
//Estilo del texto dentro del botón inferior (RE-CALCULAR)
const kLargeButtomTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);
//Estilo para el título "Tu Resultado"
const kTitleTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold);
//Estilo para el texto del resultado como "NORMAL", "SOBREPESO"
const kResultTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFF24D876),
);
//Estilo para el número grande del IMC, como 23.1
const kBMITextStyle = TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold);
//Estilo para la interpretación debajo del resultado
const kBodyTextStyle = TextStyle(fontSize: 22.0);
