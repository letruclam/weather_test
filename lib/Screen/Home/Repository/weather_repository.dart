/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-10
 * Contact: letruclamptit@gmail.com
 */

import 'package:weather_test/Screen/Home/Service/weather_service.dart';
import '../../../Base/Model/response_model.dart';

class WeatherRepository {

  final service = WeatherService();

  Future<ResponseModel> repositoryGetCurrentWeather(dynamic param) async {
    var responseModel = ResponseModel();
    responseModel = await service.getCurrentWeather(param);
    return responseModel;
  }

  Future<ResponseModel> repositoryGetForecastWeather(dynamic param) async {
    var responseModel = ResponseModel();
    responseModel = await service.getForecastWeather(param);
    return responseModel;
  }

}