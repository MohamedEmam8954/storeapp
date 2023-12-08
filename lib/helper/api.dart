import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class Api {
  Future<List<dynamic>> get({required String url}) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is a problem with satus code ${response.statusCode} with body ${response.statusCode} ");
    }
  }

  Future<dynamic> add(
      {required String url, required dynamic body, String? token}) async {
    Map<String, String> header = {};
    if (token == null) {
      header.addAll(
        {
          "Authorization": "Bearer$token",
        },
      );
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is a problem with satus code ${response.statusCode} with body ${response.statusCode} ");
    }
  }

  Future<dynamic> put(
      {required String url, required dynamic body, String? token}) async {
    Map<String, String> header = {
      "Content-Type": "application/x-www-form-urlencoded",
    };
    if (token != null) {
      header.addAll(
        {"Authorization": "Bearers$token"},
      );
    }
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: header,
    );
    log("url:$url body:$body token:$token");
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      log(data.toString());
      return data;
    } else {
      throw Exception(
          "there is an problem in status code ${response.statusCode} with body ${response.body}");
    }
  }
}
