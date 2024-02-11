import 'package:flutter/material.dart';
import 'package:meu_imc/model/list_imc_model.dart';
import 'package:meu_imc/model/gender_model.dart';
import 'package:provider/provider.dart';
import 'package:meu_imc/utils/colors.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    var list = Provider.of<ListImcModel>(context);
    var gender = Provider.of<GenderModel>(context);
    var nomeController = TextEditingController();
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: list.listImc.length,
            itemBuilder: (context, index) {
              var item = list.listImc[index];
              return ListTile(
                title: Text(item.nome),
                subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(item.imcText), Text('IMC:' + item.imc)]),
                leading: Icon(Icons.fitness_center, color: item.imcColor),
                trailing: GestureDetector(
                  onTap: () {
                    list.removeListImc(item);
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.activeColor,
            foregroundColor: MyColors.activeColorText,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text('Novo Registro'),
                    content: Column(
                      children: <Widget>[
                        TextField(
                          controller: nomeController,
                          decoration: const InputDecoration(
                            labelText: 'Nome',
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            const Text('IMC: '),
                            Text(gender.imc.toStringAsFixed(2)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            const Text('Resultado: '),
                            Text(gender.imcText),
                          ],
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.activeColor,
                          foregroundColor: MyColors.activeColorText,
                        ),
                        onPressed: () {
                          Navigator.of(bc).pop();
                        },
                        child: const Text('Cancelar'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.activeColor,
                          foregroundColor: MyColors.activeColorText,
                        ),
                        onPressed: () {
                          list.addListImc(
                            ListImcModel(
                              nomeController.text,
                              gender.imc.toStringAsFixed(2),
                              gender.imcText,
                              gender.imcTextColor,
                            ),
                          );
                          Navigator.of(bc).pop();
                        },
                        child: const Text('Salvar'),
                      ),
                    ],
                  );
                });
          },
          child: const Text('Novo Registro'),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
