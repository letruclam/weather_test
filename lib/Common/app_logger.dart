/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */


import 'dart:developer';

import 'package:flutter/foundation.dart';

class MyLogger {
  //Log a message at level verbose.
  void v(dynamic message) {
    _log("🤍 VERBOSE: $message");
  }

  //Log a message at level debug.
  void d(dynamic message) {
    _log("💙 DEBUG: $message");
  }

  //Log a message at level info.
  void i(dynamic message) {
    _log("❤️ INFO: $message");
  }

  void get(dynamic get) {
    _log("💙 GET_URL: $get");
  }
  void post(dynamic post) {
    _log("💙 POST_URL: $post");
  }

  void body(dynamic body) {
    _log("💙 BODY: $body");
  }

  void h(Map<String,dynamic> message) {
    _log("HEADERS:");
    message.forEach((key, value) => kv('- $key',v));
  }

  void response(dynamic response) {
    _log("RESPONSE: $response");
  }

  void kv(String key,Object v) {
    _log('$key: v');
  }

  //Log a message at level warning.
  void w(dynamic message) {
    _log("💛 WARNING: $message");
  }

  //Log a message at level error.
  void e(dynamic message) {
    _log("❤️ ERROR: $message");
  }

  void _log(dynamic message) {
    if (kDebugMode) {
      print("$message");
    }
  }

  //Log a long message
  void long(dynamic message) {
    log(message);
  }
}

var logger = MyLogger();