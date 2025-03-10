/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */


import 'package:weather_test/Base/Cubit/cubit_viewmodel.dart';
import 'package:weather_test/Screen/Home/State/weather_state.dart';

class WeatherViewModel extends BaseViewModel<WeatherState> {
  WeatherViewModel(): super(InformationWeather());


  onCreate() async {
    showLoading();

  }

}