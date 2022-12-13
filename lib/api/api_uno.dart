import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uno/uno.dart';

import '../services/local_storage.dart';

class ApiUno {
  static final url = "${dotenv.env['API_URL']}";
  static final http = Uno(
    baseURL: url,
    timeout: const Duration(seconds: 7),
  );
  static final headers = <String, String>{
    "Content-Type": "application/json",
    "x-token": LocalStorage.preferences.getString('x-token') ?? ''
  };
  static final noHeaders = <String, String>{
    "Content-Type": "application/json",
  };
  static responseFail(Object e) => Response(
      headers: headers,
      request: Request(
          headers: headers,
          uri: Uri.parse(url),
          method: '',
          timeout: const Duration(seconds: 0)),
      status: 500,
      data: e);

//
  static Future<Response> get(String path) async {
    try {
      return await http.get(
        path,
        headers: headers,
        validateStatus: (s) => s < 500,
      );
    } catch (e) {
      return responseFail(e);
    }
  }

  static Future<Response> getNoHeaders(String path) async {
    try {
      return await http.get(
        path,
        headers: noHeaders,
        validateStatus: (s) => s > 500,
      );
    } catch (e) {
      return responseFail(e);
    }
  }

  static Future<Response> post(String path, dynamic data) async {
    try {
      return await http.post(
        path,
        headers: headers,
        validateStatus: (s) => s < 500,
        data: data,
      );
    } catch (e) {
      return responseFail(e);
    }
  }

  static Future<Response> postNoHeader(String path, dynamic data) async {
    try {
      return await http.post(
        path,
        headers: noHeaders,
        validateStatus: (s) => s < 500,
        data: data,
      );
    } catch (e) {
      return responseFail(e);
    }
  }

  static Future<Response> put(String path, String id, dynamic data) async {
    try {
      return await http.put(
        '$path/$id',
        headers: headers,
        validateStatus: (s) => s < 500,
        data: data,
      );
    } catch (e) {
      return responseFail(e);
    }
  }

  static Future<Response> delete(String path, String id) async {
    try {
      return http.delete(
        '$path/$id',
        headers: headers,
        validateStatus: (s) => s < 500,
      );
    } catch (e) {
      return responseFail(e);
    }
  }
}
