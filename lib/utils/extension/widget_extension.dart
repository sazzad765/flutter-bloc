import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget horizontalPadding(double padding) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: padding), child: this);

  Widget verticalPadding(double padding) =>
      Padding(padding: EdgeInsets.symmetric(vertical: padding), child: this);

  Widget padding({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
          padding: EdgeInsets.only(
            bottom: bottom,
            left: left,
            right: right,
            top: top,
          ),
          child: this);

  Widget height(double height) => SizedBox(height: height, child: this);

  Widget width(double width) => SizedBox(width: width, child: this);

  Widget loading(bool showLoading, {double? radius}) {
    return Stack(
      children: [
        this,
        if (showLoading)
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.7),
                  borderRadius:
                      BorderRadius.all(Radius.circular(radius ?? 30))),
              child: const Center(
                  child: CircularProgressIndicator(
                strokeCap: StrokeCap.round,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
              )))
      ],
    ).height(50);
  }
}
