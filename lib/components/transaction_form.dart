import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionForm extends StatelessWidget {

  final tituloController = TextEditingController();
  final valueController = TextEditingController();

  TransactionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                     TextField(
                      controller: tituloController,
                      decoration: const InputDecoration(labelText: 'Título'),
                    ),
                     TextField(
                      controller: valueController,
                      decoration: const InputDecoration(labelText: 'Valor (R\$)'),
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            print(tituloController.text);
                            print(valueController.text);
                          },
                          child: const Text('Nova Transação'),
                          style: TextButton.styleFrom(
                            primary: Colors.purpleAccent
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
  }
}