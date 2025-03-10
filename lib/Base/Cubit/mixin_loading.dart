/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */



import 'cubit_loading.dart';

mixin LoadingMixin {
  final loadingCubit = LoadingCubit();

  void showLoading() {
    loadingCubit.showLoading();
  }

  void hideLoading() {
    loadingCubit.hideLoading();
  }
}
