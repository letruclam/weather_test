/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-11
 * Contact: letruclamptit@gmail.com
 */


import 'package:weather_test/Base/Model/weather_model.dart';

class ForecastModel {
  List<WeatherData>? list;

  ForecastModel({this.list});

  ForecastModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <WeatherData>[];
      json['list'].forEach((v) {
        list!.add(WeatherData.fromJson(v));
      });
    }
  }
}

class WeatherData {
  Main? main;
  int? dt;

  WeatherData({this.main, this.dt});

  WeatherData.fromJson(Map<String, dynamic> json) {
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    dt = json['dt'];
  }
}