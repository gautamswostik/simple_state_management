import 'package:flutter/material.dart';
import 'package:view_state_manager/utils/view_state_with_callback_config.dart';
import 'package:view_state_manager/view_state_manager.dart';

class StateManagedWithCallBackView extends StatefulWidget {
  const StateManagedWithCallBackView({super.key});

  @override
  State<StateManagedWithCallBackView> createState() =>
      _StateManagedWithCallBackViewState();
}

class _StateManagedWithCallBackViewState
    extends State<StateManagedWithCallBackView> {
  MydataWithCallback mydataWithCallback = MydataWithCallback();
  @override
  void initState() {
    mydataWithCallback.showSuccess();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Satat",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ViewStateManagerWithCallback<String>(
        viewStateConfig: ViewStateWithCallbackConfig<String>(
          loadingWidget: (data) {
            return loadingWidget();
          },
          successWidget: (data) {
            return successWidget(successText: data);
          },
          errorWidget: (data) {
            return successWidget(successText: data);
          },
        ),
        currentState:
            mydataWithCallback.manageViewStateWithCallBack.getCurrentState,
      ),
    );
  }

  Widget loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget successWidget({required String successText}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(successText)),
        ElevatedButton(
          onPressed: () {
            mydataWithCallback.showError();
          },
          child: const Text("Get Error"),
        ),
      ],
    );
  }

  Widget errorWidget({required String errorText}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(errorText)),
        ElevatedButton(
          onPressed: () {
            mydataWithCallback.showSuccess();
          },
          child: const Text("Get Success"),
        ),
      ],
    );
  }
}

class MydataWithCallback {
  ManageViewStateWithCallBack<String> manageViewStateWithCallBack =
      ManageViewStateWithCallBack<String>(
          currentViewState: ValueNotifier((ViewState.loading, "Initial")));

  void showSuccess() {
    manageViewStateWithCallBack.setCurrentState =
        (ViewState.loading, "Loading");
    Future.delayed(
      const Duration(seconds: 5),
      () async {
        manageViewStateWithCallBack.setCurrentState =
            (ViewState.success, "Data Loaded Successfully");
      },
    );
  }

  void showError() {
    manageViewStateWithCallBack.setCurrentState =
        (ViewState.loading, "Loading");
    Future.delayed(
      const Duration(seconds: 5),
      () async {
        manageViewStateWithCallBack.setCurrentState =
            (ViewState.success, "Data Load unsuccessfull");
      },
    );
  }
}
