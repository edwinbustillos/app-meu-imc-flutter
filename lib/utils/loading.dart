import 'package:flutter/material.dart';
import 'package:meu_imc/utils/colors.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        LinearProgressIndicator(
          backgroundColor: MyColors.backgroundLoading,
          valueColor: AlwaysStoppedAnimation<Color>(MyColors.linearLoading),
        ),
        Text('Loading...'),
      ],
    );
  }
}
