import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meu_imc/pages/home_page.dart';
import 'package:meu_imc/model/theme_model.dart';
import 'package:meu_imc/model/page_view_model.dart';
import 'package:meu_imc/model/gender_model.dart';
import 'package:meu_imc/model/list_imc_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeModel()),
        ChangeNotifierProvider(create: (context) => PageViewModel()),
        ChangeNotifierProvider(create: (context) => GenderModel()),
        ChangeNotifierProvider(
            create: (context) => ListImcModel('', '', '', Colors.white)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, theme, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meu IMC',
        theme: ThemeData(
          brightness: theme.isDarkTheme ? Brightness.dark : Brightness.light,
          scaffoldBackgroundColor: theme.primaryColor,
          useMaterial3: true,
        ),
        home: MyHomePage(title: 'Meu IMC'),
      ),
    );
  }
}
