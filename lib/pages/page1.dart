import 'package:flutter/material.dart';
import 'package:meu_imc/widgets/quad_card.dart';
import 'package:meu_imc/model/gender_model.dart';
import 'package:provider/provider.dart';
import 'package:meu_imc/model/theme_model.dart';
import 'package:meu_imc/widgets/button_card.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    var gender = Provider.of<GenderModel>(context);
    var theme = Provider.of<ThemeModel>(context);
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender.changeGender(1);
                  },
                  child: QuadCard(
                    key: const Key('quadCard1'),
                    backColor: gender.male == 1
                        ? theme.activeBotton
                        : theme.backgroundColorQuadCard,
                    quadChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          color: gender.male == 1 ? Colors.white : Colors.black,
                          Icons.male,
                          size: 80.0,
                        ),
                        Text(
                          'Homen',
                          style: TextStyle(
                              color: gender.male == 1
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender.changeGender(0);
                  },
                  child: QuadCard(
                    key: const Key('quadCard2'),
                    backColor: gender.female == 1
                        ? theme.activeBotton
                        : theme.backgroundColorQuadCard,
                    quadChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          color: gender.male == 0 ? Colors.white : Colors.black,
                          Icons.female,
                          size: 80.0,
                        ),
                        Text(
                          'Mulher',
                          style: TextStyle(
                              color: gender.female == 1
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: QuadCard(
          key: const Key('quadCard3'),
          quadChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Altura (cm)"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      gender.height.toStringAsFixed(0),
                      style: theme.textStyleBig,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    thumbColor: theme.activeBotton,
                    trackHeight: 1.0,
                    valueIndicatorColor: Colors.white,
                  ),
                  child: Slider(
                      value: gender.height,
                      min: 110.0,
                      max: 220.0,
                      onChanged: (value) {
                        gender.changeHeight(value);
                      }),
                ),
              ]),
        )),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: QuadCard(
                  key: const Key('quadCard4'),
                  quadChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Peso"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            gender.weight.toString(),
                            style: theme.textStyleBig,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ButtonCard(
                            key: const Key('buttonCard1'),
                            color: theme.activeBotton,
                            icon: Icons.remove,
                            title: "Peso",
                            onPressedC: () {
                              gender.minusWeight();
                            },
                          ),
                          ButtonCard(
                            key: const Key('buttonCard2'),
                            color: theme.activeBotton,
                            icon: Icons.add,
                            title: "Peso",
                            onPressedC: () {
                              gender.plusWeight();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: QuadCard(
                  key: const Key('quadCard5'),
                  quadChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Idade"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            gender.years.toString(),
                            style: theme.textStyleBig,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ButtonCard(
                            key: const Key('buttonCard3'),
                            color: theme.activeBotton,
                            icon: Icons.remove,
                            title: "Idade",
                            onPressedC: () {
                              gender.minusYears();
                            },
                          ),
                          ButtonCard(
                            key: const Key('buttonCard4'),
                            color: theme.activeBotton,
                            icon: Icons.add,
                            title: "Idade",
                            onPressedC: () {
                              gender.plusYears();
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
      ],
    );
  }
}
