// ignore_for_file: prefer_const_constructors
// ignore: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto_aula1/models/moeda.dart';
import 'package:projeto_aula1/pages/detalhes_page.dart';
import 'package:projeto_aula1/repositories/MoedaRepository.dart';
import 'package:intl/intl.dart';
import 'detalhes_page.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({Key? key}) : super(key: key);

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  // Sempre inicializar variaveis FORA DO MÉTODO BUILD PORRAAAA
  final tabela = MoedaReopository.tabela;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<Moeda> selecionadas = [];

  // App bar dinamica que muda ao selecionar elementos da lista
  // contem botão de deselecionar tudo
  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: Text('Moedas App'),
      );
    } else {
      return AppBar(
        title: Text('${selecionadas.length} Selecionadas'),
        backgroundColor: Colors.green,
        leading: IconButton(
            onPressed: () {
              setState(() {
                selecionadas = [];
              });
            },
            icon: Icon(Icons.arrow_back)),
      );
    }
  }

  // Função para levar até a tela de detathes de uma moeda
  mostrarDetalhes(Moeda moeda) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => DetalhesPage(moeda: moeda)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarDinamica(),
        floatingActionButton: (selecionadas.isNotEmpty)
            ? FloatingActionButton.extended(
                label: Text('Favoritos'),
                onPressed: () {},
                icon: Icon(Icons.star),
              )
            : null,
        body: ListView.separated(
            itemBuilder: (BuildContext context, moeda) {
              return ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  leading: (selecionadas.contains(tabela[moeda])
                      ? CircleAvatar(child: Icon(Icons.check))
                      : SizedBox(
                          child: Image.asset(tabela[moeda].icone), width: 40)),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tabela[moeda].nome,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16)),
                      Text(tabela[moeda].sigla,
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  trailing: Text(real.format(tabela[moeda].preco)),
                  selected: selecionadas.contains(tabela[moeda]),
                  selectedTileColor: Colors.indigo[50],
                  onTap: () {
                    setState(() {
                      if (selecionadas.isNotEmpty) {
                        if (selecionadas.contains(tabela[moeda])) {
                          selecionadas.remove(tabela[moeda]);
                        } else {
                          selecionadas.add(tabela[moeda]);
                        }
                      } else {
                        mostrarDetalhes(tabela[moeda]);
                      }
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (selecionadas.contains(tabela[moeda])) {
                        selecionadas.remove(tabela[moeda]);
                      } else {
                        selecionadas.add(tabela[moeda]);
                      }
                      print(selecionadas.length);
                    });
                  });
            },
            padding: EdgeInsets.all(12),
            separatorBuilder: (_, __) => Divider(
                  height: 5,
                ),
            itemCount: tabela.length));
  }
}
