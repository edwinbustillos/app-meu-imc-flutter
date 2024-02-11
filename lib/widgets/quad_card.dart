import 'package:flutter/material.dart';
import 'package:meu_imc/model/theme_model.dart';
//import 'package:meu_imc/model/gender_model.dart';
import 'package:provider/provider.dart';

class QuadCard extends StatelessWidget {
  const QuadCard({required Key key, this.quadChild, this.backColor})
      : super(key: key);

  final Widget? quadChild;
  final Color? backColor;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeModel>(context);

    return Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: backColor ?? theme.backgroundColorQuadCard,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: quadChild,
    );
  }
}
