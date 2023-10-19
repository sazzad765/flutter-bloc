import 'package:bloc_example/presentation/common/custom_card.dart';
import 'package:bloc_example/presentation/common/custom_expansion_panel.dart';
import 'package:flutter/material.dart';

class CustomExpendableCard extends StatelessWidget {
  const CustomExpendableCard(
      {Key? key,
      required this.child,
      required this.expendableChild,
      required this.isExpanded,
      this.onExpanded,
      this.margin})
      : super(key: key);
  final Widget child;
  final Widget expendableChild;
  final EdgeInsetsGeometry? margin;
  final bool isExpanded;
  final Function(bool)? onExpanded;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        elevation: 1,
        margin: margin ?? const EdgeInsets.all(0),
        child: AppExpansionPanelList(
          animationDuration: const Duration(milliseconds: 500),
          expansionCallback: (panelIndex, isExpanded) {
            if (onExpanded != null) onExpanded!.call(!isExpanded);
          },
          elevation: 0,
          expandedHeaderPadding: const EdgeInsets.all(0),
          children: [
            ExpansionPanel(
                isExpanded: isExpanded,
                canTapOnHeader: onExpanded != null,
                headerBuilder: (context, isExpanded) => child,
                body: expendableChild)
          ],
        ));
  }
}
