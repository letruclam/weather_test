/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-10
 * Contact: letruclamptit@gmail.com
 */



class ResponseModel {
  int? status = 200;
  String? message = '';
  dynamic data;

  ResponseModel({this.status, this.message, this.data});
}