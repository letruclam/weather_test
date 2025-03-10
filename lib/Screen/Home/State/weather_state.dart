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

  // LocationLoaded(this.latitude, this.longitude);
  // List<Object?> get props => [latitude, longitude];
}



class LocationError extends WeatherState {
  final String message;

  LocationError(this.message);

  List<Object?> get props => [message];
}