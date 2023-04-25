import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpWrapper {
  static Future<T?> get<T>(
      {required String url,
      Map<String, String>? headers,
      required T Function(Map<String, dynamic>) fromJson}) async {
    try {
      final res = await http.get(Uri.parse(url), headers: headers);
      if (res.statusCode >= 300) {
        throw res.body;
      }
      final data = jsonDecode(res.body);

      return fromJson(data);
    } catch (e) {
      return null;
    }
  }
}
