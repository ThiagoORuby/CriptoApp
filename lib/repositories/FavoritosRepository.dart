import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:projeto_aula1/models/moeda.dart';

class FavoritosRepository extends ChangeNotifier {
  final List<Moeda> _lista = [];

  UnmodifiableListView<Moeda> get lista => UnmodifiableListView(_lista);

  saveAll(List<Moeda> moedas) {
    moedas.forEach((moeda) {
      if (!_lista.contains(moeda)) _lista.add(moeda);
    });

    notifyListeners();
  }

  remove(Moeda moeda) {
    _lista.remove(moeda);
    notifyListeners();
  }
}
