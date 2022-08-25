import 'package:finmanager/models/transction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) => runApp(myApp());

class myApp extends StatelessWidget {
  myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tenis',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    )
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Despesas pessoais'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: const Card(
                color: Colors.lightBlueAccent,
                elevation: 5,
                child: Text('Grafico'),
              ),
            ),
            Column(
              children: _transactions.map((e) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            e.value.toString()
                          ),
                        ),
                        Column(
                          children: [
                            Text(e.title),
                            Text(e.date.toString())
                          ],
                        )
                      ],
                    ),
                  );
                }
              ).toList(),
            )
          ],
        ));
  }
}
