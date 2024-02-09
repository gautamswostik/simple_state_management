import 'package:example/views/state_managed_with_callback_view.dart';
import 'package:flutter/material.dart';
import 'package:view_state_manager/view_state_manager.dart';

class StateManagedView extends StatefulWidget {
  const StateManagedView({super.key});

  @override
  State<StateManagedView> createState() => _StateManagedViewState();
}

class _StateManagedViewState extends State<StateManagedView> {
  ManageViewState viewState = ManageViewState();

  Future<void> changeViewState() async {
    viewState.setCurrentState = ViewState.loading;
    Future.delayed(const Duration(seconds: 5), () {
      viewState.setCurrentState = ViewState.success;
    });
  }

  Future<void> changeViewStateToError() async {
    viewState.setCurrentState = ViewState.loading;
    Future.delayed(const Duration(seconds: 5), () {
      viewState.setCurrentState = ViewState.error;
    });
  }

  @override
  void initState() {
    changeViewState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "View One",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StateManagedWithCallBackView(),
                ),
              );
            },
            icon: const Icon(
              Icons.numbers_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ViewStateManager(
        viewStateConfig: ViewStateConfig(
          loadingWidget: loadingWidget(),
          successWidget: successWidget(),
          errorWidget: errorWidget(),
        ),
        currentState: viewState.getCurrentState,
      ),
    );
  }

  Widget loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget successWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(child: Text("SUCCESS")),
        ElevatedButton(
          onPressed: () {
            changeViewStateToError();
          },
          child: const Text("Get Error"),
        ),
      ],
    );
  }

  Widget errorWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(child: Text("ERROR")),
        ElevatedButton(
          onPressed: () {
            changeViewState();
          },
          child: const Text("Get Success"),
        ),
      ],
    );
  }
}
