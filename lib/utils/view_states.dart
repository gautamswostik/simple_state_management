import 'package:flutter/widgets.dart';

enum ViewState {
  initial,
  loading,
  success,
  error,
  extra,
}

class ManageViewState {
  final ValueNotifier<ViewState> _currentViewState =
      ValueNotifier(ViewState.initial);

  ValueNotifier<ViewState> get getCurrentState {
    return _currentViewState;
  }

  set setCurrentState(ViewState state) {
    _currentViewState.value = state;
  }
}

class ManageViewStateWithCallBack<T> {
  final ValueNotifier<(ViewState, T)> _currentViewState;

  ManageViewStateWithCallBack(
      {required ValueNotifier<(ViewState, T)> currentViewState})
      : _currentViewState = currentViewState;

  ValueNotifier<(ViewState, T)> get getCurrentState {
    return _currentViewState;
  }

  set setCurrentState((ViewState, dynamic) state) {
    _currentViewState.value = (state.$1, state.$2);
  }
}
