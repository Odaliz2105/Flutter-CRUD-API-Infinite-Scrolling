import 'dart:convert';
import 'package:http/http.dart' as http;

class CheapSharkService {
  static Future<List<dynamic>> getDeals({
    required int page,
    required int limit,
  }) async {
    final url = Uri.parse(
      'https://www.cheapshark.com/api/1.0/deals?pageNumber=$page&pageSize=$limit',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception('Error API');
  }
}