import 'package:flutter/material.dart';

//Widget personalizado para crear un botón redondo con ícono en el centro reutilizable
class RoundIconButtom extends StatelessWidget {
  const RoundIconButtom({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon; //Ícono que se mostrará en el botón
  final VoidCallback onPressed; //Función que se ejecuta al presionar el botón

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: Color(0xFF8D8E98),
      child: Icon(icon),
    );
  }
}
