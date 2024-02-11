import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meu_imc/model/theme_model.dart';
import 'package:meu_imc/utils/loading.dart';
import 'package:meu_imc/pages/page1.dart';
import 'package:meu_imc/pages/page2.dart';
import 'package:meu_imc/pages/page3.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final PageController _pageController = PageController();
  final String title;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              theme.isDarkTheme ? Icons.brightness_3 : Icons.brightness_7,
            ),
            onPressed: () {
              theme.toggleTheme();
            },
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        onPageChanged: (index) {
          theme.changeIndexMenuBotton(index);
        },
        itemBuilder: (context, index) {
          return FutureBuilder(
            future: Future.delayed(const Duration(seconds: 1)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingPage();
              } else {
                if (index == 0) {
                  return const Page1();
                } else if (index == 1) {
                  return const Page2();
                } else if (index == 2) {
                  return const Page3();
                } else {
                  return Center(
                    child: Text('Page ${index + 1}'),
                  );
                }
              }
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: theme.indexMenuBotton,
        fixedColor: theme.activeBotton,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
                size: 50,
              ),
              label: 'Dados'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
                size: 50,
              ),
              label: 'Calcular'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt,
                size: 50,
              ),
              label: 'Historico'),
        ],
        onTap: (index) {
          theme.changeIndexMenuBotton(index);
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
