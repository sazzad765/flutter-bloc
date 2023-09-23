import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key,
      this.borderRadius = 15.0,
      required this.child,
      this.onTap,
      this.padding,
      this.backgroundColor,
      this.margin,
      this.borderWidth,
      this.elevation = 0})
      : super(key: key);

  final Widget child;
  final double borderRadius;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double elevation;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: borderWidth == null
            ? BorderSide.none
            : BorderSide(width: borderWidth ?? 1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: elevation,
      color: backgroundColor,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 1, vertical: 0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: child),
        ),
      ),
    );
  }
}
