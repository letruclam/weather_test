/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */


import 'package:geolocator/geolocator.dart';
import 'package:weather_test/Base/Cubit/cubit_viewmodel.dart';
import 'package:weather_test/Screen/Home/Repository/weather_repository.dart';
import 'package:weather_test/Screen/Home/State/weather_state.dart';

import '../../../Common/app_logger.dart';

class WeatherViewModel extends BaseViewModel<WeatherState> {
  WeatherViewModel(): super(InformationWeather());

  final _repository = WeatherRepository();


  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(LocationError("Location services are disabled."));
        return;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(LocationError("Location access permission is denied."));
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        emit(LocationError("Location access permission is permanently denied."));
        return;
      }
      showLoading();
      var position = await Geolocator.getCurrentPosition();
      var res = await _repository.repositoryGetCurrentWeather(position);
      logger.response(res);
      hideLoading();


      //emit(LocationLoaded(position.latitude, position.longitude));
    } catch (e) {
      emit(LocationError("Error get location: $e"));
    }
  }



}