import 'package:flutter/widgets.dart';

class ViewStateWithCallbackConfig<T> {
  final Widget Function(T)? initialWidget;
  final Widget Function(T) loadingWidget;
  final Widget Function(T) successWidget;
  final Widget Function(T) errorWidget;
  final Widget Function(T)? extraWidget;

  ViewStateWithCallbackConfig({
    this.initialWidget,
    required this.loadingWidget,
    required this.successWidget,
    required this.errorWidget,
    this.extraWidget,
  });
}
