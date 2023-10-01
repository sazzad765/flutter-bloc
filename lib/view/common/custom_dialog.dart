import 'package:bloc_example/utils/theme/custom_themes.dart';
import 'package:bloc_example/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    Key? key,
    required this.title,
    required this.content,
    this.padding,
  }) : super(key: key);
  final Widget content;
  final EdgeInsetsGeometry? padding;
  final String title;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              children: [
                const SizedBox(width: 40),
                Expanded(
                    child: Text(widget.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle().boldFont)),
                SizedBox(
                    width: 40,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(FontAwesomeIcons.xmark),
                    )),
              ],
            ),
            const Divider(thickness: 1, height: 1, endIndent: 10, indent: 10),
            Flexible(
                child: Container(
                    padding: widget.padding ?? const EdgeInsets.all(16),
                    child: widget.content)),
          ])),
    );
  }
}
