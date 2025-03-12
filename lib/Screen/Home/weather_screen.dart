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
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> with SingleTickerProviderStateMixin {
  bool isBottomSheetVisible = false;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<WeatherViewModel, WeatherState>(
      callBlocCubit: (onCubit) => onCubit.getCurrentLocation(),
      builder: (context, onCubit, state) {
        if (state is LocationError) {
          return _buildErrorView(onCubit);
        } else if (state is LocationLoaded) {
          Future.delayed(const Duration(milliseconds: 500), () => setState(() => isBottomSheetVisible = true));
          return _buildWeatherView(state);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildErrorView(WeatherViewModel onCubit) {
    return Container(
      color: const Color(0xFFE85959),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Something went wrong\nat our end!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 54, color: Colors.white, fontFamily: "Roboto", fontWeight: FontWeight.w100),
          ),
          GestureDetector(
            onTap: () => onCubit.getCurrentLocation(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: const EdgeInsets.only(top: 44),
              decoration: BoxDecoration(color: const Color(0xFF4A4A4A), borderRadius: BorderRadius.circular(2)),
              child: const Text("RETRY", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherView(LocationLoaded state) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const SizedBox(height: 56),
              _buildTemperatureText(state.tempCurrent),
              _buildLocationText(state.nameCurrent),
            ],
          ),
        ),
        _buildBottomSheet(state.avgTempsPerDay),
      ],
    );
  }

  Widget _buildTemperatureText(String? temp) {
    return Text(
      "${temp ?? "--"}°",
      style: const TextStyle(color: Color(0xFF2A2A2A), fontSize: 96, height: 1.2, fontFamily: "Roboto", fontWeight: FontWeight.w900),
    );
  }

  Widget _buildLocationText(String? location) {
    return Text(
      location ?? "Unknown",
      style: const TextStyle(color: Color(0xFF556799), fontSize: 36, height: 1.4, fontFamily: "Roboto", fontWeight: FontWeight.w100),
    );
  }

  Widget _buildBottomSheet(Map<String, double> avgTempsPerDay) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      bottom: isBottomSheetVisible ? 0 : -250,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        child: Column(
          children: avgTempsPerDay.entries.take(4).map((entry) => _buildDayTempRow(entry.key, entry.value)).toList(),
        ),
      ),
    );
  }

  Widget _buildDayTempRow(String day, double temp) {
    return Column(
      children: [
        Container(
          height: 80,
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(day, style: _dayTempTextStyle()),
              Text("${temp.toStringAsFixed(1)} C", style: _dayTempTextStyle()),
            ],
          ),
        ),
        const Divider(indent: 16, endIndent: 16, color: Colors.grey),
      ],
    );
  }

  TextStyle _dayTempTextStyle() => const TextStyle(fontSize: 16, color: Color(0xFF2A2A2A), fontFamily: "Roboto", fontWeight: FontWeight.w400);
}

