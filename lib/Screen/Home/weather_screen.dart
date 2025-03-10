/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */

import 'package:flutter/material.dart';
import 'package:weather_test/Base/app_widget.dart';
import 'package:weather_test/Screen/Home/State/weather_state.dart';
import 'package:weather_test/Screen/Home/ViewModel/weather_viewmodel.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return StateWeatherScreen();
  }
}

class StateWeatherScreen extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<WeatherViewModel, WeatherState>(
        callBlocCubit: (callBlocCubit) {
      callBlocCubit.onCreate();
    }, builder: (context, onCubit, state) {
      return Container();
    });
  }
}
