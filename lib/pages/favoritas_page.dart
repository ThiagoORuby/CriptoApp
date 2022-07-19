import 'package:flutter/material.dart';
import 'package:projeto_aula1/repositories/FavoritosRepository.dart';
import 'package:projeto_aula1/widgets/moeda_card.dart';
import 'package:provider/provider.dart';

class FavoritasPage extends StatefulWidget {
  FavoritasPage({Key? key}) : super(key: key);

  @override
  State<FavoritasPage> createState() => _FavoritasPageState();
}

class _FavoritasPageState extends State<FavoritasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Favoritas')),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Consumer<FavoritosRepository>(
              builder: (context, favoritas, child) {
            return favoritas.lista.isEmpty
                ? ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Ainda não há moedas favoritas'),
                  )
                : ListView.builder(
                    itemCount: favoritas.lista.length,
                    itemBuilder: ((context, index) {
                      return MoedaCard(
                        moeda: favoritas.lista[index],
                      );
                    }));
          }),
        ));
  }
}
