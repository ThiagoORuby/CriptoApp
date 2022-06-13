// Tela com os detalhes das moedas
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../models/moeda.dart';

class DetalhesPage extends StatefulWidget {
  Moeda moeda;

  DetalhesPage({Key? key, required this.moeda}) : super(key: key);

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  double quantidade = 0;

  comprar() {
    if (_form.currentState!.validate()) {
      // Salvar a compra
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Compra realizada com sucesso')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moeda.nome),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset(widget.moeda.icone),
                height: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                real.format(widget.moeda.preco),
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Colors.grey[800]),
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          (quantidade > 0)
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(color: Colors.teal.withOpacity(0.05)),
                    child: Text(
                      "$quantidade ${widget.moeda.sigla}",
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                    margin: EdgeInsets.only(bottom: 24),
                  ))
              : Container(margin: EdgeInsets.only(bottom: 24)),
          Form(
              key: _form,
              child: TextFormField(
                controller: _valor,
                style: TextStyle(fontSize: 20),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType:
                    TextInputType.number, // define o tipo de teclado utilizado
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'valor',
                    prefixIcon: Icon(Icons.monetization_on_outlined),
                    suffix: Text('reais', style: TextStyle(fontSize: 14))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "informe o valor da compra";
                  } else if (double.parse(value) < 50) {
                    return "Compra minima de 50 reais";
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  // SetState possibilita a alteração automatica,
                  //sem clicar na tecla de confirmar do teclado
                  setState(() {
                    quantidade = (value.isEmpty)
                        ? 0
                        : double.parse(value) / widget.moeda.preco;
                  });
                },
              )),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 24),
            child: ElevatedButton(
                onPressed: (() {
                  comprar();
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(Icons.check),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Comprar',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                )),
          )
        ]),
      ),
    );
  }
}
