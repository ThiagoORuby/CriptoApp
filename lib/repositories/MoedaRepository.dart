import '../models/moeda.dart';

class MoedaReopository {
  static List<Moeda> tabela = [
    Moeda(
        icone: 'images/bitcoin.png',
        nome: 'Bitcoin',
        sigla: 'BTC',
        preco: 142201.47),
    Moeda(
        icone: 'images/ethereum.png',
        nome: 'Ethereum',
        sigla: 'ETH',
        preco: 7679.61),
    Moeda(
        icone: 'images/cardano.png',
        nome: 'Cardano',
        sigla: 'ADA',
        preco: 2.79),
    Moeda(
        icone: 'images/cronos.png', nome: 'Cronos', sigla: 'CRO', preco: 0.769),
    Moeda(
        icone: 'images/tether.png', nome: 'Tether', sigla: 'USDT', preco: 4.98),
    Moeda(icone: 'images/tron.png', nome: 'TRON', sigla: 'TRX', preco: 0.3814)
  ];
}
