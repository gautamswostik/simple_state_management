import 'package:flutter/widgets.dart';

class ViewStateConfig {
  final Widget initialWidget;
  final Widget loadingWidget;
  final Widget successWidget;
  final Widget errorWidget;
  final Widget? extraWidget;

  ViewStateConfig({
    this.initialWidget = const SizedBox.shrink(),
    required this.loadingWidget,
    required this.successWidget,
    required this.errorWidget,
    this.extraWidget = const SizedBox.shrink(),
  });
}
