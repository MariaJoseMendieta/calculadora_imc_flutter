import 'package:flutter/material.dart';

//Widget reutilizable para crear tarjetas que pueden tener contenido personalizado
class Reusablecard extends StatelessWidget {
  const Reusablecard({
    super.key,
    required this.colour, //Color de fondo de la tarjeta
    this.cardChild, //Contenido interno (ícono y texto)
    this.onPress, //Función que se ejecuta al hacer tap
  });

  final Color colour;
  final Widget? cardChild; //'?' Permite que sea nulo (opcional)
  final VoidCallback? onPress; // Tipo especial para funciones sin parámetros

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress, //Detecta toques y ejecuta la función
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: cardChild, //Renderiza el contenido dentro de la tarjeta
      ),
    );
  }
}
