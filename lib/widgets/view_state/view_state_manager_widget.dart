import 'package:flutter/widgets.dart';
import 'package:view_state_manager/utils/view_state_config.dart';
import 'package:view_state_manager/utils/view_states.dart';

class ViewStateManager extends StatelessWidget {
  const ViewStateManager({
    super.key,
    required this.viewStateConfig,
    required this.currentState,
  });
  final ViewStateConfig viewStateConfig;
  final ValueNotifier<ViewState> currentState;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentState,
      builder: (context, value, child) {
        switch (value) {
          case ViewState.initial:
            return viewStateConfig.initialWidget;
          case ViewState.loading:
            return viewStateConfig.loadingWidget;
          case ViewState.success:
            return viewStateConfig.successWidget;
          case ViewState.error:
            return viewStateConfig.errorWidget;
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
