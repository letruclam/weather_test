/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../DI/locator.dart';
import 'Cubit/cubit_loading.dart';
import 'Widget/loading_widget.dart';

class BaseWidget<U extends Cubit<T>, T extends Object> extends StatefulWidget {
  final Widget Function(BuildContext context, U onCubit, T state) builder;
  final Function(U) callBlocCubit;

  const BaseWidget({
    super.key,
    required this.callBlocCubit,
    required this.builder,
  });

  @override
  State<StatefulWidget> createState() {
    return _BaseWidgetState<U, T>();
  }
}

class _BaseWidgetState<U extends Cubit<T>, T extends Object>
    extends State<BaseWidget<U, T>> {
  late final U cubit;

  @override
  void didChangeDependencies() {
    cubit = locator.get<U>();
    widget.callBlocCubit(cubit);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocProvider(
            create: (_) => cubit,
            child: BlocBuilder<U, T>(builder: (context, state) {
              return widget.builder(context, cubit, state);
            }),
          ),
          BlocProvider.value(
            value: LoadingCubit(),
            child: BlocBuilder<LoadingCubit, bool>(
              builder: (context, data) {
                return Visibility(
                  visible: data,
                  child: LoadingWidget(isLoading: data),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }
}



