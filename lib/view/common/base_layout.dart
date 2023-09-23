import 'package:bloc_example/utils/base_state.dart';
import 'package:bloc_example/utils/status.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key, required this.state, required this.child});

  final BaseState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (state.status == Status.loading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.red),
      );
    }
    if (state.status == Status.initial) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.red),
      );
    }

    if (state.status == Status.error) {
      return const Center(
        child: Text("No data found!"),
      );
    }
    return child;
  }
}
