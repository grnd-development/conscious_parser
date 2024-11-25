import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:main/api/products/dto.dart';

class Request {
  final String baseUrl;
  final bool isHttps;
  final bool isOpenAi;
  final bool isOpenFoodFacts;

  // final String _apiKey =
  //     "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";
  final String _apiKey =
      "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";

  Request(this.baseUrl,
      {this.isHttps = true,
      this.isOpenAi = false,
      this.isOpenFoodFacts = false});

  Future<Map<String, dynamic>> get(
      {required String endpoint, Map<String, String>? queryParameters}) async {
    try {
      final uri = isHttps
          ? Uri.https(baseUrl, endpoint, queryParameters)
          : Uri.http(baseUrl, endpoint, queryParameters);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<dynamic> post(
      {required String endpoint,
      required Map<String, dynamic> body,
      bool isOpenAi = false}) async {
    final uri =
        isHttps ? Uri.https(baseUrl, endpoint) : Uri.http(baseUrl, endpoint);
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    if (isOpenAi) {
      headers['Authorization'] = 'Bearer $_apiKey';
    }

    final response = await http.post(
      uri,
      headers: headers,
      body: json.encode(body),
    );

    if (this.isOpenFoodFacts || this.isOpenAi) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception(
            'Failed to load data: ${response.statusCode} ${response.body}');
      }
    } else {
      if (response.statusCode == 200) {
        return ResponseModel.fromJson(json.decode(response.body));
      } else if (response.statusCode == 422) {
        return ResponseModel.fromJson(json.decode(response.body));
      } else {
        throw Exception(
            'Failed to load data: ${response.statusCode} ${response.body}');
      }
    }
  }

  Future<dynamic> put(
      {required String endpoint,
      required Map<String, dynamic> body,
      bool isOpenAi = false}) async {
    final uri =
        isHttps ? Uri.https(baseUrl, endpoint) : Uri.http(baseUrl, endpoint);
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    if (isOpenAi) {
      headers['Authorization'] = 'Bearer $_apiKey';
    }

    final response = await http.put(
      uri,
      headers: headers,
      body: json.encode(body),
    );

    if (this.isOpenFoodFacts || this.isOpenAi) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception(
            'Failed to load data: ${response.statusCode} ${response.body}');
      }
    } else {
      if (response.statusCode == 200) {
        return ResponseModel.fromJson(json.decode(response.body));
      } else if (response.statusCode == 422) {
        return ResponseModel.fromJson(json.decode(response.body));
      } else {
        throw Exception(
            'Failed to load data: ${response.statusCode} ${response.body}');
      }
    }
  }
}
