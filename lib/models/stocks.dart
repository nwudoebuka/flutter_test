// To parse this JSON data, do
//
//     final stocksMarket = stocksMarketFromJson(jsonString);

import 'dart:convert';

StocksMarket stocksMarketFromJson(String str) =>
    StocksMarket.fromJson(json.decode(str));

String stocksMarketToJson(StocksMarket data) => json.encode(data.toJson());

class StocksMarketing {
  final String? symbol;
  final String? company;
  final int? price;

  StocksMarketing({
    this.company,
    this.price,
    this.symbol,
  });
  static List<StocksMarketing> getStocksMarketing() {
    List<StocksMarketing> stocks = <StocksMarketing>[];
    stocks.add(StocksMarketing(
        company: 'Apple Company', symbol: 'APPLE', price: 10000));
    stocks.add(
        StocksMarketing(company: 'Microsoft', symbol: 'MSOFT', price: 9000));
    stocks.add(StocksMarketing(company: 'Google', symbol: 'GOOG', price: 8000));
    stocks.add(StocksMarketing(
        company: 'General Electronics', symbol: 'GE', price: 7000));
    stocks
        .add(StocksMarketing(company: 'Home Depot', symbol: 'HE', price: 6000));
    stocks.add(
        StocksMarketing(company: 'Evergeen Solar', symbol: 'EVR', price: 5000));
    stocks.add(StocksMarketing(company: 'Facebook', symbol: 'FB', price: 4000));
    stocks.add(StocksMarketing(company: 'Samsung', symbol: 'SAM', price: 3000));
    stocks
        .add(StocksMarketing(company: 'Snapchat', symbol: 'SNAP', price: 2000));
    stocks
        .add(StocksMarketing(company: 'Alphabet', symbol: 'ALPH', price: 5000));
    return stocks;
  }
}

class StocksMarket {
  StocksMarket({
    required this.data,
  });

  final List<Datum> data;

  factory StocksMarket.fromJson(Map<String, dynamic> json) => StocksMarket(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.volume,
    required this.symbol,
    required this.exchange,
    required this.date,
  });

  final int volume;
  final String symbol;
  final String exchange;
  final String date;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        volume: json["volume"] ?? 0,
        symbol: json["symbol"] ?? '',
        exchange: json["exchange"] ?? '',
        date: json["date"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "volume": volume,
        "symbol": symbol,
        "exchange": exchange,
        "date": date,
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
