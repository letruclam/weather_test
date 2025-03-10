/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */


enum MethodApi {
  get,
  post,
  put,
  delete,
  upload
}
extension MethodExtension on MethodApi {
  String get valueOf{
    switch (this) {
      case MethodApi.get:
        return 'GET';
      case MethodApi.post:
        return 'POST';
      case MethodApi.put:
        return 'PUT';
      case MethodApi.delete:
        return 'DELETE';
      default:
        return '';
    }
  }
}
