import 'package:bloc_example/utils/base_state.dart';
import 'package:bloc_example/utils/status.dart';
import 'package:bloc_example/view/common/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({
    super.key,
    required this.title,
    required this.state,
    required this.child,
    this.actions,
  });

  final BaseState state;
  final Widget child;
  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        actions: actions,
      ),
      body: state.status.isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.red),
            )
          : state.status.isInitial
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.red),
                )
              : state.status.isError
                  ? const Center(
                      child: Text("No data found!"),
                    )
                  : child,
    );
  }
}
