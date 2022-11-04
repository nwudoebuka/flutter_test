// To parse this JSON data, do
//
//     final randomCompanies = randomCompaniesFromJson(jsonString);

import 'dart:convert';

RandomCompanies randomCompaniesFromJson(String str) =>
    RandomCompanies.fromJson(json.decode(str));

String randomCompaniesToJson(RandomCompanies data) =>
    json.encode(data.toJson());

class RandomCompanies {
  RandomCompanies({
    required this.pagination,
    required this.data,
  });

  final Pagination pagination;
  List<Data> data;

  factory RandomCompanies.fromJson(Map<String, dynamic> json) =>
      RandomCompanies(
        pagination: Pagination.fromJson(json["pagination"]),
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    required this.name,
    required this.symbol,
    required this.stockExchange,
  });

  final String name;
  final String symbol;
  final StockExchange stockExchange;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        symbol: json["symbol"],
        stockExchange: StockExchange.fromJson(json["stock_exchange"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
        "stock_exchange": stockExchange.toJson(),
      };
}

class StockExchange {
  StockExchange({
    required this.name,
    required this.acronym,
  });

  final String name;
  final String acronym;

  factory StockExchange.fromJson(Map<String, dynamic> json) => StockExchange(
        name: json["name"],
        acronym: json["acronym"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "acronym": acronym,
      };
}

class Pagination {
  Pagination({
    required this.total,
  });

  final int total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}
