/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */


import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_test/Base/Cubit/cubit_viewmodel.dart';
import 'package:weather_test/Base/Model/forecast_model.dart';
import 'package:weather_test/Screen/Home/Repository/weather_repository.dart';
import 'package:weather_test/Screen/Home/State/weather_state.dart';
import '../../../Base/Model/weather_model.dart';
import '../../../Common/app_logger.dart';

class WeatherViewModel extends BaseViewModel<WeatherState> {
  WeatherViewModel() : super(InformationWeather());

  final _repository = WeatherRepository();

  Future<void> getCurrentLocation() async {
    try {
      final position = await _checkLocationPermission();
      if (position == null) return;
      showLoading();
      final res = await _repository.repositoryGetCurrentWeather(position);
      final modelResponse = WeatherModel.fromJson(res.data);

      final resForecast = await _repository.repositoryGetForecastWeather(position);
      final modelForecastResponse = ForecastModel.fromJson(resForecast.data);
      final avgTempsPerDay = _calculateAvgTemp(modelForecastResponse);

      emit(LocationLoaded(modelResponse.main?.temp.toString(), modelResponse.name, avgTempsPerDay));
      logger.response(modelResponse);
      logger.response(modelForecastResponse);
      hideLoading();
    } catch (e) {
      hideLoading();
      emit(LocationError("Error getting location: $e"));
    }
  }

  Future<Position?> _checkLocationPermission() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      emit(LocationError("Location services are disabled."));
      return null;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(LocationError("Location access permission is denied."));
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(LocationError("Location access permission is permanently denied."));
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }

  Map<String, double> _calculateAvgTemp(ForecastModel modelForecastResponse) {
    final tempData = <String, List<double>>{};
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);

    for (var data in modelForecastResponse.list ?? []) {
      final date = DateTime.fromMillisecondsSinceEpoch(data.dt! * 1000);
      final dayName = DateFormat('EEEE').format(date);

      if (date.isAfter(todayOnly) && date.difference(todayOnly).inDays <= 4) {
        tempData.putIfAbsent(dayName, () => []).add(data.main!.temp!);
      }
    }

    return tempData.map((key, value) => MapEntry(key, value.reduce((a, b) => a + b) / value.length));
  }
}