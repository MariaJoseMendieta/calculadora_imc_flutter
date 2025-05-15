import 'package:flutter/material.dart';
import '../constants.dart';

//Widget personalizado para mostrar un ícono y un texto (Hombre/Mujer)
class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.icon, required this.label});
  final IconData icon; //Ícono que se va a mostrar
  final String label; //Texto debajo del ícono

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0),
        SizedBox(height: 15.0),
        Text(label, style: kLabelTextStyle),
      ],
    );
  }
}
