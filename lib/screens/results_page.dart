import 'package:bmi_calculator_flutter/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:bmi_calculator_flutter/components/buttom_button.dart';

//Pantalla de resultados que se muestra después de presionar "CALCULAR" (segunda página)
class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  final String bmiResult; //Resultado del IMC calculado
  final String resultText; //Clasificación del resultado
  final String interpretation; //Texto de interpretación y consejos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CALCULADORA IMC'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Tu Resultado', style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusablecard(
              colour: kActiveCardColor,
              cardChild: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 15.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ), //Muestra el texto del resultado en mayúsculas
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ), //Muestra el valor numérico del IMC
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ), //Muestra la interpretación personalizada
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(
                context,
              ); //Regresa a la pantalla anterior (InputPage)
            },
            buttonTitle: 'RE-CALCULAR',
          ),
        ],
      ),
    );
  }
}
