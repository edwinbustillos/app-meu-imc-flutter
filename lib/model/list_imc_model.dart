import 'package:flutter/material.dart';

class ListImcModel extends ChangeNotifier {
  final String _id = UniqueKey().toString();
  String _nome;
  String _imc;
  String _imcText;
  Color _imcColor;

  ListImcModel(this._nome, this._imc, this._imcText, this._imcColor);

  final List<ListImcModel> _listImc = [];

  List<ListImcModel> get listImc => List.from(_listImc);
  String get id => _id;
  String get nome => _nome;
  String get imc => _imc;
  String get imcText => _imcText;
  Color get imcColor => _imcColor;

  void setNome(String nome) {
    _nome = nome;
  }

  void setImc(String imc) {
    _imc = imc;
  }

  void setImcText(String imcText) {
    _imcText = imcText;
  }

  void setImcColor(Color imcColor) {
    _imcColor = imcColor;
  }

  void setListImc(List<ListImcModel> listImc) {
    _listImc.addAll(listImc);
    notifyListeners();
  }

  void addListImc(ListImcModel listImc) {
    _listImc.add(listImc);
    notifyListeners();
  }

  void removeListImc(ListImcModel listImc) {
    _listImc.remove(listImc);
    notifyListeners();
  }

  void updateListImc(ListImcModel listImc) {
    final index = _listImc.indexWhere((element) => element.id == listImc.id);
    if (index >= 0) {
      _listImc[index] = listImc;
    }
    notifyListeners();
  }
}
