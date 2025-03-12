/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-10
 * Contact: letruclamptit@gmail.com
 */

import 'package:weather_test/Network/service_bloc.dart';

import '../../../Base/Model/response_model.dart';
import '../../../Network/end_points.dart';
import '../../../Network/method_api.dart';

class WeatherService extends ServiceBloc {

  Future<ResponseModel> getCurrentWeather(dynamic param) async {
    var response = ResponseModel();
    await connectApi(param,"${myUrl.urlGetCurrentWeather}?lat=${param.latitude}&lon=${param.longitude}&appid=f125793879c6ea639d0eca8fc9583822&units=metric",MethodApi.get, (res) => response = res);
    return response;
  }

  Future<ResponseModel> getForecastWeather(dynamic param) async {
    var response = ResponseModel();
    await connectApi(param,"${myUrl.urlGetForecastWeather}?lat=${param.latitude}&lon=${param.longitude}&appid=f125793879c6ea639d0eca8fc9583822&units=metric",MethodApi.get, (res) => response = res);
    return response;
  }
}