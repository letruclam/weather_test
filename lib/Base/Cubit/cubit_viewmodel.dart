/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mixin_loading.dart';


abstract class BaseViewModel<T> extends Cubit<T> with LoadingMixin {
  BaseViewModel(T initialState) : super(initialState);

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
