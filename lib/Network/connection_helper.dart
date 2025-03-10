/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */


import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionHelper {
  static ConnectivityResult? _connectivityResult;

  static Future _connect() async {
    _connectivityResult = (await Connectivity().checkConnectivity()) as ConnectivityResult?;
  }

  static Future<bool> hasConnection() async {
    await _connect();
    if(_connectivityResult == ConnectivityResult.wifi || _connectivityResult == ConnectivityResult.mobile) return true;
    return false;
  }

}