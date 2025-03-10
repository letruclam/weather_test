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

class StateWeatherScreen extends State<WeatherScreen> with SingleTickerProviderStateMixin {
  bool isBottomSheetVisible = false;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<WeatherViewModel, WeatherState>(
      callBlocCubit: (onCubit) {
        onCubit.getCurrentLocation();
      },
      builder: (context, onCubit, state) {
        if (state is LocationError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              isBottomSheetVisible = true;
            });
          });
          return Stack(
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    const SizedBox(height: 56),
                    const Text(
                      "20°",
                      style: TextStyle(
                        color: Color(0xFF2A2A2A),
                        fontSize: 96,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                    ),
                    const Text(
                      "HO CHI MINH",
                      style: TextStyle(
                        color: Color(0xFF556799),
                        fontSize: 36,
                        fontWeight: FontWeight.w300,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                bottom: isBottomSheetVisible ? 0 : -250,
                left: 0,
                right: 0,
                child: Container(
                  height: 250,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Weather Details",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Humidity: 70%"),
                          Text("Wind: 5 km/h"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Pressure: 1012 hPa"),
                          Text("Visibility: 10 km"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
