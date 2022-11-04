class ApiService {
  String? token;

  setHeaders() async {
    const token = '350b8acbefde974e0a0c3f427d55e232';
    return {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token'
    };
  }

  final baseUrl =
      'http://api.marketstack.com/v1/tickers?access_key=350b8acbefde974e0a0c3f427d55e232';
}
