import 'dart:convert';

class Coin {
  final String id;
  final String symbol;
  final String name;

  Coin({required this.id, required this.symbol,required this.name});

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
      id: json["id"],
      symbol: json["symbol"],
      name: json["name"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "symbol": symbol, "name": name};
}
class Library {
  final List<Coin> coins; // 1


  Library({required this.coins});

  factory Library.fromRawJson(String str) => Library.fromJson(json.decode(str)); // 2

  factory Library.fromJson(Map<String, dynamic> json) => Library(
     coins: List<Coin>.from(
          json["bookList"].map((x) => Coin.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "bookList": List<dynamic>.from(coins.map((x) => x.toJson())),
      };
}