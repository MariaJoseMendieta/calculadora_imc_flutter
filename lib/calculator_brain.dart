import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int height; //Altura en centímetros
  final int weight; //Peso en kilogramos

  late double _bmi; //Variable privada para almacenar el resultado del BMI

  //Metodo que calcula el valor del BMI
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  //Metodo para determinar el resultado (sobrepeso, normal y bajo peso)
  String getResult() {
    if (_bmi >= 25) {
      return 'Sobrepeso';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Bajo peso';
    }
  }

  // Metodo para obtener una interpretación personalizada según el resultado del BMI
  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Tienes un peso corporal superior al normal. Intenta hacer más ejercicio';
    } else if (_bmi > 18.5) {
      return 'Tienes un peso corporal normal. Buen trabajo!';
    } else {
      return 'Tienes un peso corporal inferior al normal. Puede comer un poco más';
    }
  }
}
