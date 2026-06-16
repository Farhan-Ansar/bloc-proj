import 'dart:convert';
import 'dart:io';
import 'package:bloc_proj/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

import '../exceptions/app_exceptions.dart';

class NetworkApiService implements BaseApiService {


  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };


  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body);
      case 401:
        throw UnauthorisedException(response.body);
      case 404:
        throw NotFoundException(response.body);
      case 500:
        throw InternalServerException(response.body);
      default:
        throw FetchDataException('Status code: ${response.statusCode}');
    }
  }

  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response = await http
          .get(Uri.parse(url), headers: _headers)
          .timeout(const Duration(seconds: 30));
      return _returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    }
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    try {
      final response = await http
          .post(Uri.parse(url), headers: _headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 30));
      return _returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    }
  }

  @override
  Future<dynamic> putApi(String url, dynamic data) async {
    try {
      final response = await http
          .put(Uri.parse(url), headers: _headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 30));
      return _returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    }
  }

  @override
  Future<dynamic> deleteApi(String url) async {
    try {
      final response = await http
          .delete(Uri.parse(url), headers: _headers)
          .timeout(const Duration(seconds: 30));
      return _returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    }
  }

  @override
  Future<dynamic> patchApi(String url, dynamic data) async {
    try {
      final response = await http
          .patch(Uri.parse(url), headers: _headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 30));
      return _returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    }
  }
}
