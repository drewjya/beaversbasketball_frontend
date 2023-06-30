import 'dart:convert';
import 'dart:developer';

import 'package:beaverbasketball/src/core/api/url.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class HttpWrapper {
  static Future<T> get<T>(
      {required String url,
      Map<String, String>? headers,
      required T Function(dynamic map) fromJson}) async {
    try {
      final res = await http.get(Uri.parse(url), headers: headers);

      if (res.statusCode >= 300) {
        throw jsonDecode(res.body)["message"];
      }
      if (headers != null && headers.containsValue("Bearer ")) {
        return fromJson({});
      }
      log(res.body);
      final data = jsonDecode(res.body);

      return fromJson(data["data"]);
    } catch (e) {
      throw e;
    }
  }

  static Future<T> postFileMultiPart<T>(
      {required String url,
      Map<String, String>? headers,
      void Function(http.MultipartRequest fields)? requestFields,
      Map<String, PlatformFile>? bodyFile,
      required T Function(Map<String, dynamic> map) fromJson}) async {
    await http.get(Uri.parse(ApiUrl.getTokenSanctum));

    final uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    // if (body != null) {
    //   final datas = body.entries;
    //   for (var i = 0; i < datas.length; i++) {
    //     final data = datas.elementAt(i);
    //     request.fields["${data.key}"] = data.value;
    //   }
    // }

    requestFields?.call(request);

    log("${request.fields}");
    if (bodyFile != null) {
      final datas = bodyFile.entries;
      for (var i = 0; i < datas.length; i++) {
        final data = datas.elementAt(i);
        request.files.add(http.MultipartFile.fromBytes(
            data.key, data.value.bytes?.toList() ?? [],
            filename: "${data.key}.${data.value.extension}"));
      }
    }
    var response = await request.send();

    // Check the response

    if (response.statusCode == 200) {
      print('Request sent successfully!');
      return fromJson({});
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw ('Request failed with status: ${response.statusCode}.');
    }

    // print(response.extra);
    // print(response.data);
    // log("${response.headers}");
    // String csrfToken =
    //     response.headers.map['Set-Cookie']![0].split(';')[0].split('=')[1];
    // dio.options.headers['X-XSRF-TOKEN'] = csrfToken;
    //   try {
    //     req = await dio.post(
    //       ApiUrl.postRegisterMember,
    //       data: FormData.fromMap(dataItem),
    //     );

    //     return fromJson(req.data["data"]);
    //   } catch (e) {
    //     log("$e");
    //     print(e);
    //     log("REQ ${req?.data} ${req?.statusCode}");
    //     throw "$e";
    //   }
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
      T Function(Map<String, dynamic> map)? fromJson}) async {
    try {
      final res = await http.post(Uri.parse(url), headers: headers, body: body);

      if (res.statusCode >= 300) {
        print(res.body);
        throw jsonDecode(res.body)["message"];
      }

      if (fromJson == null) {
        return res as dynamic;
      }
      final data = jsonDecode(res.body);

      return fromJson(data["data"]);
    } catch (e) {
      print(e);
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
