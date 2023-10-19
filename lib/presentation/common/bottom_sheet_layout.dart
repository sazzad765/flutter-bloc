import 'package:flutter/material.dart';

class BottomSheetLayout extends StatefulWidget {
  const BottomSheetLayout({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<BottomSheetLayout> createState() => _BottomSheetLayoutState();
}

class _BottomSheetLayoutState extends State<BottomSheetLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 80,
                child: Divider(
                  color: Colors.grey.withOpacity(0.6),
                  height: 50,
                  thickness: 3,
                ),
              ),
              widget.child,
            ],
          ),
        ));
  }
}
