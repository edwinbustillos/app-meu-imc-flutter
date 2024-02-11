import 'package:flutter/material.dart';

class GenderModel extends ChangeNotifier {
  int _gender = 0;
  int _male = 0;
  int _female = 1;
  double _height = 180;
  int _weight = 60;
  int _years = 20;
  double _imc = 0;
  String _imcText = 'Ideal';
  String _imcTextMsg = 'Peso ideal';
  Color _imcTextColor = Colors.black;

  int get currentGender => _gender;
  int get male => _male;
  int get female => _female;
  double get height => _height;
  int get weight => _weight;
  int get years => _years;
  double get imc => _imc;
  String get imcText => _imcText;
  String get imcTextMsg => _imcTextMsg;
  Color get imcTextColor => _imcTextColor;

  void changeGender(int index) {
    _gender = index;
    if (currentGender == 1) {
      _male = 1;
      _female = 0;
    } else if (currentGender == 0) {
      _male = 0;
      _female = 1;
    }
    notifyListeners();
  }

  void changeHeight(double index) {
    _height = index;
    notifyListeners();
  }

  void changeWeight(int index) {
    _weight = index;
    notifyListeners();
  }

  void plusWeight() {
    changeWeight(_weight + 1);
  }

  void minusWeight() {
    changeWeight(_weight - 1);
  }

  void changeYears(int index) {
    _years = index;
    notifyListeners();
  }

  void plusYears() {
    changeYears(_years + 1);
  }

  void minusYears() {
    changeYears(_years - 1);
  }

  Future<void> calculateImc() async {
    _imc = _weight / ((_height / 100) * (_height / 100));
    if (_imc < 18.6) {
      _imcText = 'Abaixo do peso';
      _imcTextColor = Color.fromARGB(255, 179, 64, 255);
      _imcTextMsg =
          'Você tem um peso corporal inferior ao normal. Você pode comer um pouco mais.';
    } else if (_imc >= 18.6 && _imc < 24.9) {
      _imcText = 'Peso ideal';
      _imcTextColor = Color.fromARGB(255, 72, 198, 116);
      _imcTextMsg = 'Você está no peso ideal, Parabéns !';
    } else if (_imc >= 24.9 && _imc < 29.9) {
      _imcText = 'Levemente acima do peso';
      _imcTextColor = Color.fromARGB(255, 234, 154, 6);
      _imcTextMsg =
          'Você tem um peso corporal acima do normal. Tente se exercitar mais.';
    } else if (_imc >= 29.9 && _imc < 34.9) {
      _imcText = 'Obesidade Grau I';
      _imcTextColor = Color.fromARGB(255, 234, 154, 6);
      _imcTextMsg =
          'Você tem um peso corporal acima do normal. Tente se exercitar mais e comer de forma saudável.';
    } else if (_imc >= 34.9 && _imc < 39.9) {
      _imcText = 'Obesidade Grau II';
      _imcTextColor = Color.fromARGB(255, 234, 154, 6);
      _imcTextMsg =
          'Você tem um peso corporal acima do normal. Tente se exercitar mais e comer de forma saudável consulte um nutricionista.';
    } else if (_imc >= 40) {
      _imcText = 'Obesidade Grau III';
      _imcTextColor = Colors.red;
      _imcTextMsg =
          'Você tem um peso corporal acima do normal. Tente se exercitar mais e comer de forma saudável consulte um medico.';
    }
    notifyListeners();
  }
}
