/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */
import 'base_url.dart' as base_url;


class _MyURL {
  final urlGetCurrentWeather = "${base_url.domainURL}weather";
  final urlGetForecastWeather = "${base_url.domainURL}forecast";

}

final myUrl = _MyURL();