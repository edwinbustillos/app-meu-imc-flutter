import 'package:flutter/material.dart';
//import 'package:meu_imc/model/list_imc_model.dart';
import 'package:meu_imc/model/gender_model.dart';
import 'package:provider/provider.dart';
import 'package:meu_imc/utils/colors.dart';
import 'package:meu_imc/utils/sqlite.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  var dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    //var list = Provider.of<ListImcModel>(context);
    var gender = Provider.of<GenderModel>(context);
    var nomeController = TextEditingController();
    var dbHelper = DatabaseHelper();
    return Column(
      children: <Widget>[
        Expanded(
          child: FutureBuilder<List<Map>>(
            future: dbHelper.getIMCs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Erro: ${snapshot.error.toString()}'));
              } else {
                var list = snapshot.data;
                return ListView.builder(
                  itemCount: list?.length,
                  itemBuilder: (context, index) {
                    var item = list?[index];
                    return ListTile(
                      title: Text(item?['nome']),
                      subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item?['imc']),
                            Text('IMC:' + item?['resultado'])
                          ]),
                      leading:
                          const Icon(Icons.fitness_center, color: Colors.green),
                      trailing: GestureDetector(
                        onTap: () {
                          dbHelper.deleteIMC(item?['id']);
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                );
              }
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
                          dbHelper.saveIMC(
                            nomeController.text,
                            gender.imcText,
                            gender.imc.toStringAsFixed(2),
                          );
                          setState(() {});
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
