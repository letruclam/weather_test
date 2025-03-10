/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */

import 'dart:convert';

import '../Common/app_logger.dart';
import 'method_api.dart';
import 'package:dio/dio.dart';


class HttpHelper {
  static Dio? _client;

  static Future<Dio> _getInstance(MethodApi methodApi,Function(Options) options) async {
    _client ??= Dio();
    return _client!;
  }

  static Future<Response> get(String url) async {
    var op = Options();
    logger.get(url);
    final instance = await _getInstance(MethodApi.get,(p0) => op = p0);
    return instance.get(url,options: op);
  }
  static Future<Response> post(String url, {dynamic body}) async {
    var op = Options();
    logger.post(url);
    final instance = await _getInstance(MethodApi.post,(p0) => op = p0);
    logger.body(jsonEncode(body));
    return instance.post(url,data: body,options: op);
  }

}