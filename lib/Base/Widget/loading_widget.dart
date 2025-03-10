/*
 *
 * Author: Lê Trúc Lâm (Tony Lee)
 * Date: 2025-03-09
 * Contact: letruclamptit@gmail.com
 */

import 'package:flutter/cupertino.dart';

import '../../Common/app_colors.dart';

class LoadingWidget extends StatefulWidget {
  final bool isLoading;

  const LoadingWidget({super.key, required this.isLoading});

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant LoadingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading) {
      _controller.repeat();
    } else {
      _controller.stop();
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isLoading,
      child: Container(
        color: AppColor.background,
        child: Center(
          child: SizedBox(
            height: 96,
            width: 96,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * 3.1416,
                  child: child,
                );
              },
              child: Image.asset('assets/icons/drawable-mdpi/ic_loading.png'),
            ),
          ),
        ),
      ),
    );
  }
}