/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */



import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingCubit extends Cubit<bool> {
  static final LoadingCubit _instance = LoadingCubit._internal();

  factory LoadingCubit() => _instance;
  LoadingCubit._internal() : super(false);

  showLoading() => emit(true);

  hideLoading() => emit(false);

}
