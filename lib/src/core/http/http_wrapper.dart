import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class HttpWrapper {
  static Future<T> get<T>(
      {required String url,
      Map<String, String>? headers,
      required T Function(Map<String, dynamic> map) fromJson}) async {
    try {
      final res = await http.get(Uri.parse(url), headers: headers);

      if (res.statusCode >= 300) {
        throw jsonDecode(res.body)["message"];
      }
      if (headers != null && headers.containsValue("Bearer ")) {
        return fromJson({});
      }
      final data = jsonDecode(res.body);

      return fromJson(data["data"]);
    } catch (e) {
      throw e;
    }
  }

  static Future<T> getList<T>(
      {required String url,
      Map<String, String>? headers,
      required T Function(List map) fromJson}) async {
    try {
      final res = await http.get(Uri.parse(url), headers: headers);

      if (res.statusCode >= 300) {
        throw jsonDecode(res.body)["message"];
      }

      final data = jsonDecode(res.body);
      log("$data");

      return fromJson(data["data"]);
    } catch (e) {
      throw e;
    }
  }

  static Future<T> getYoutube<T>(
      {required String url,
      Map<String, String>? headers,
      required T Function(Map<String, dynamic> map) fromJson}) async {
    try {
      final res = await http.get(Uri.parse(url), headers: headers);

      if (res.statusCode >= 300) {
        throw jsonDecode(res.body);
      }

      final data = jsonDecode(res.body);

      return fromJson(data);
    } catch (e) {
      throw e;
    }
  }

  static Future<T> post<T>(
      {required String url,
      Map<String, String>? headers,
      Map<String, dynamic>? body,
      required T Function(Map<String, dynamic> map) fromJson}) async {
    try {
      final res = await http.post(Uri.parse(url), headers: headers, body: body);

      if (res.statusCode >= 300) {
        throw jsonDecode(res.body)["message"];
      }

      final data = jsonDecode(res.body);

      return fromJson(data["data"]);
    } catch (e) {
      throw e;
    }
  }

  static Future<T> delete<T>(
      {required String url,
      Map<String, String>? headers,
      required T Function(Map<String, dynamic> map) fromJson}) async {
    try {
      final res = await http.delete(
        Uri.parse(url),
        headers: headers,
      );

      if (res.statusCode >= 300) {
        throw jsonDecode(res.body)["message"];
      }

      final data = jsonDecode(res.body);

      return fromJson(data["data"]);
    } catch (e) {
      throw e;
    }
  }
}
