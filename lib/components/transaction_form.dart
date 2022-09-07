import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionForm extends StatelessWidget {
  final tituloController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) _onSubmit;

  TransactionForm(this._onSubmit);

  _submitted() {
    final title = tituloController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <= 0){
      return;
    }

    _onSubmit(title, value);
  }

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
              onSubmitted: (_) => _submitted(),
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: valueController,
              onSubmitted: (_) => _submitted(),
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _submitted,
                  child: const Text('Nova Transação'),
                  style: TextButton.styleFrom(primary: Colors.purpleAccent),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
