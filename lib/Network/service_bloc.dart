/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-10
 * Contact: letruclamptit@gmail.com
 */

import 'dart:convert';

import '../Base/Model/response_model.dart';
import '../Common/app_logger.dart';
import 'dio_helper.dart';
import 'method_api.dart';

class ServiceBloc {
  Future connectApi(dynamic param, String url, MethodApi method,
      Function(ResponseModel) res) async {
    var response = ResponseModel();
    dynamic retApi;
    if (method == MethodApi.post) {
      retApi = HttpHelper.post(url, body: param);
    } else if (method == MethodApi.get) {
      retApi = HttpHelper.get(url);
    }
    await retApi.then((value) {
      response.status = 200;
      var res = jsonDecode(value.toString());
      if (res != null ) {
        response.data = res;
      }
      logger.response(value);
    }).catchError((e) {
      response.message = "Error";
      logger.e(e.toString());
    });
    res.call(response);
  }
}