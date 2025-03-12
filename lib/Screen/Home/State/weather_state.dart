/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */


sealed class WeatherState {}



class InformationWeather extends WeatherState {

}

class LocationLoaded extends WeatherState {
  String? tempCurrent;
  String? nameCurrent;
  final Map<String, double> avgTempsPerDay;

  LocationLoaded(this.tempCurrent, this.nameCurrent,this.avgTempsPerDay);
  List<Object?> get props => [tempCurrent, nameCurrent,avgTempsPerDay];
}


class ForecastState extends WeatherState {
  final Map<String, double> avgTempsPerDay;
  ForecastState(this.avgTempsPerDay);
  List<Object?> get props => [avgTempsPerDay];
}



class LocationError extends WeatherState {
  final String message;

  LocationError(this.message);

  List<Object?> get props => [message];
}