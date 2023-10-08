import 'package:flutter/cupertino.dart';

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
}
