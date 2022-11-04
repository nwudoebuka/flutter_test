import 'package:http/http.dart' as http;
import 'package:market_stock/exports.dart';

class StockServices {
  final client = http.Client();
  ApiService apiService = ApiService();

  Future<Response> getStockMarketDetails() async {
    final headers = await apiService.setHeaders();
    final response =
        await client.get(Uri.parse(apiService.baseUrl), headers: headers);
    return response;
  }
}
