import 'package:flutter/material.dart';
import '../constants.dart';

//Widget personalizado para crear un botón en la parte inferior que se reutiliza en varias pantallas para acciones como 'CALCULAR' y 'RE-CALCULAR'
class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.onTap,
    required this.buttonTitle,
  });

  final VoidCallback onTap; //Función que se ejecuta al presionar el botón
  final String buttonTitle; //Título del botón (texto visible)

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
        child: Center(child: Text(buttonTitle, style: kLargeButtomTextStyle)),
      ),
    );
  }
}
