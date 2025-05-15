import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; //Iconos adicionales
import '../components/icon_content.dart'; //Widget personalizado para íconos y etiquetas
import '../components/reusable_card.dart'; //Widget reutilizable de tarjeta
import '../constants.dart';
import 'results_page.dart';
import '../components/buttom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator_flutter/calculator_brain.dart';

//Enumeración para manejar el género seleccionado
enum Gender { male, female }

//Clase principal que representa la pantalla donde el usuario introduce los datos
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender; //Estado que guarda el género seleccionado
  int height = 180;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CALCULADORA IMC'), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                //Tarjeta para seleccionar género masculino
                Expanded(
                  child: Reusablecard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour:
                        selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MASCULINO',
                    ),
                  ),
                ),
                //Tarjeta para seleccionar género femenino
                Expanded(
                  child: Reusablecard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour:
                        selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMENINO',
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Sección para seleccionar la altura usando un Slider
          Expanded(
            child: Reusablecard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ALTURA', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text('cm', style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      //Forma del "thumb" (el círculo que el usuario arrastra)
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      thumbColor: Color(0xFFafb42b),
                      //Forma del "overlay" que aparece cuando el usuario mantiene presionado el thumb (resplandor)
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                      overlayColor: Color(0x29f0f4c3),
                      activeTrackColor: Color(0xFFcddc39),
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value:
                          height
                              .toDouble(), //Valor actual del slider (debe ser double)
                      min: 100.0, //Valor mínimo que se puede seleccionar
                      max: 230.0, //Valor máximo que se puede seleccionar
                      onChanged: (double newValue) {
                        setState(() {
                          height =
                              newValue
                                  .round(); //Convierte el valor a entero y actualiza la variable
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Sección para modificar el peso
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusablecard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('PESO', style: kLabelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(weight.toString(), style: kNumberTextStyle),
                            Text('kg'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButtom(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButtom(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //Sección para modificar la edad
                Expanded(
                  child: Reusablecard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('EDAD', style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButtom(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButtom(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Botón para calcular el IMC y navegar a la pantalla de resultados
          BottomButton(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
              );

              //Navega a la pantalla de resultados con los valores calculados
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  },
                ),
              );
            },
            buttonTitle: 'CALCULAR',
          ),
        ],
      ),
    );
  }
}
