import 'package:flutter/material.dart';
import 'package:meu_imc/widgets/quad_card.dart';
import 'package:provider/provider.dart';
import 'package:meu_imc/model/theme_model.dart';
import 'package:meu_imc/model/gender_model.dart';
import 'package:meu_imc/utils/loading.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  GenderModel? gender;
  ThemeModel? theme;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        gender = Provider.of<GenderModel>(context, listen: false);
        theme = Provider.of<ThemeModel>(context, listen: false);
        gender?.calculateImc();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GenderModel>(
      builder: (context, gender, child) {
        if (gender.imc == 0.0) {
          return const LoadingPage();
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Resultado:'),
                    const SizedBox(height: 20.0),
                    Text(
                      gender.imcText,
                      style: TextStyle(
                        color: gender.imcTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        shadows: const <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 36.0,
                            color: Color.fromARGB(255, 143, 143, 143),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(gender.imcTextMsg, textAlign: TextAlign.center),
                  ],
                ),
              ),
              Expanded(
                child: QuadCard(
                  key: const Key('dddd'),
                  quadChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('IMC'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            gender.imc.toStringAsFixed(2),
                            style: theme?.textStyleBig,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
