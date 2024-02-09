import 'package:flutter/widgets.dart';
import 'package:view_state_manager/utils/view_state_with_callback_config.dart';
import 'package:view_state_manager/utils/view_states.dart';

class ViewStateManagerWithCallback<T> extends StatelessWidget {
  const ViewStateManagerWithCallback({
    super.key,
    required this.viewStateConfig,
    required this.currentState,
  });
  final ViewStateWithCallbackConfig<T> viewStateConfig;
  final ValueNotifier<(ViewState, T)> currentState;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentState,
      builder: (context, value, child) {
        switch (value.$1) {
          case ViewState.initial:
            return viewStateConfig.initialWidget!.call(value.$2);
          case ViewState.loading:
            return viewStateConfig.loadingWidget.call(value.$2);
          case ViewState.success:
            return viewStateConfig.successWidget.call(value.$2);
          case ViewState.error:
            return viewStateConfig.errorWidget.call(value.$2);
          case ViewState.extra:
            return viewStateConfig.extraWidget!.call(value.$2);
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
