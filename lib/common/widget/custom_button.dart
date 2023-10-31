import 'package:bloc_example/common/utils/theme/custom_themes.dart';
import 'package:flutter/material.dart';

typedef Callback = void Function();

class CustomButton extends StatelessWidget {
  final Icon? icon;
  final CustomButtonType type;
  final Widget? child;
  final String? text;
  final Color? textColor;
  final Callback? onPressed;
  final double? height;
  final Color? color;
  final Gradient? gradient;
  final bool showProgressIndicator;
  final double borderRadius;
  final bool wrapText;

  const CustomButton({
    Key? key,
    CustomButtonType? type = CustomButtonType.standard,
    this.icon,
    this.child,
    this.text,
    this.textColor = Colors.white,
    this.onPressed,
    this.height = 50.0,
    this.color,
    this.gradient,
    this.showProgressIndicator = false,
    this.wrapText = true,
    this.borderRadius = 40,
  })  : type = type ?? CustomButtonType.standard,
        super(key: key);

  Widget _buildCustomButtonType(Widget contents, CustomButtonType customButtonType, ThemeData theme) {
    switch (customButtonType) {
      case CustomButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            side: BorderSide(
                width: 1.5,
                color: color == null ? theme.colorScheme.error : color!),
          ),
          child: contents,
        );
      case CustomButtonType.standard:
      default:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            backgroundColor: color,
          ),
          onPressed: onPressed,
          child: contents,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return _buildCustomButtonType(contents(theme), type, theme);
  }

  Widget contents(ThemeData theme) {
    double leftPadding;
    double rightPadding;

    if (icon != null) {
      if (text != null) {
        leftPadding = 8.0;
        rightPadding = 12.0;
      } else {
        leftPadding = 0.0;
        rightPadding = 0.0;
      }
    } else {
      leftPadding = 12.0;
      rightPadding = 12.0;
    }
    return Container(
      alignment: Alignment.center,
      height: height,
      child: showProgressIndicator
          ? const CircularProgressIndicator(
        color: Colors.white,
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: leftPadding),
          if (child != null) child!,
          if (text != null)
            Expanded(
              flex: wrapText ? 1 : 0,
              child: Text(
                text ?? '',
                textAlign: TextAlign.center,
                style: type == CustomButtonType.outlined
                    ? TextStyle(
                    fontSize: theme.textTheme.labelLarge!.fontSize,
                    color: color == null
                        ? theme.colorScheme.error
                        : color!)
                    : TextStyle(
                    fontSize: theme.textTheme.labelLarge!.fontSize,
                    color: textColor),
              ),
            ),
          if (icon == null) SizedBox(width: rightPadding),
          if (icon != null) icon!,
        ],
      ),
    );
  }
}

enum CustomButtonType { standard, outlined }
