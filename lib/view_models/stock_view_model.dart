import 'dart:convert';

import 'package:market_stock/models/companies.dart';
import 'package:market_stock/services/stockmarket.dart';

import '../exports.dart';
import 'base.dart';

class StockViewModel extends BaseViewModel {
  final ApiService apiService = ApiService();
  final StockServices stockServices = StockServices();
  RandomCompanies? randomCompanies;

  Future<dynamic> getStockMarketDetails() async {
    final response = await stockServices.getStockMarketDetails();
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    print(jsonResponse);
    if (jsonResponse.isNotEmpty) {
      randomCompanies = RandomCompanies.fromJson(jsonResponse);
      notifyListeners();
    }
    return jsonResponse['data'];
  }
}
