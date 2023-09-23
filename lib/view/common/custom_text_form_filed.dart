import 'package:bloc_example/utils/theme/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final String? value;
  final String? labelText;
  final String? hintText;
  final Iterable<String>? autofillHints;
  final TextAlign? textAlign;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function(String)? onBlur;
  final void Function(String)? onFinished;
  final void Function()? onTap;
  final IconData? icon;
  final CustomTextFormFieldType? type;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final InputBorder? focusInputBorder;
  final InputBorder? enabledInputBorder;
  final bool selectAllOnFocus;
  final bool readOnly;
  final bool showCursor;
  final bool obscureText;
  final bool enableSuggestions;
  final bool showClearIcon;
  final int maxLines;
  final int? maxLength;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? textField;
  final bool isDense;
  final bool isEnable;
  final bool activeOnUserInteraction;
  final Widget? suffix;
  final EdgeInsets? contentPadding;
  final EdgeInsets? margin;

  CustomTextFormField(
      {Key? key,
      this.controller,
      this.focusNode,
      this.keyboardType,
      this.value,
      this.labelText,
      this.hintText,
      this.autofillHints,
      this.textAlign,
      this.textCapitalization = TextCapitalization.none,
      this.onChanged,
      this.onSubmitted,
      this.onBlur,
      this.onFinished,
      this.onTap,
      this.icon,
      this.type,
      this.validator,
      this.textInputAction,
      this.autofocus = false,
      bool? selectAllOnFocus,
      this.readOnly = false,
      this.showCursor = true,
      this.obscureText = false,
      this.enableSuggestions = false,
      this.showClearIcon = false,
      this.maxLines = 1,
      this.maxLength,
      this.onFieldSubmitted,
      this.inputFormatters,
      this.textField,
      this.focusInputBorder,
      this.enabledInputBorder,
      this.isDense = false,
      this.isEnable = true,
      this.suffix,
      this.contentPadding,
      this.margin,
      this.activeOnUserInteraction = true})
      : assert(value != null || controller != null || textField != null),
        assert(value == null || controller == null),
        this.selectAllOnFocus =
            selectAllOnFocus ?? keyboardType == TextInputType.number,
        super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  // Used to ensure that onSubumittedOrBlur callback is only called once
  bool _submitHandled = false;
  bool _controllerIsInternal = false;

  @override
  initState() {
    super.initState();

    if (widget.controller == null) {
      _controller = TextEditingController();
      _controllerIsInternal = true;
    } else {
      _controller = widget.controller!;
    }

    if (widget.value != null) _controller.text = widget.value!;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(CustomTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update the text value if not being controlled by an external controller
    if (_controllerIsInternal &&
        widget.value != null &&
        _controller.text != widget.value) {
      _controller.text = widget.value!;
    }

    if (oldWidget.focusNode != null &&
        oldWidget.focusNode != widget.focusNode) {
      _focusNode.removeListener(_handleFocusChange);
      _focusNode = widget.focusNode ?? FocusNode();
      _focusNode.addListener(_handleFocusChange);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (_controllerIsInternal) _controller.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      if (widget.selectAllOnFocus) selectAll();
    } else {
      final text = _controller.text;
      if (widget.onBlur != null) {
        widget.onBlur!(text);
      } else if (!_submitHandled && widget.onFinished != null) {
        widget.onFinished!(text);
      }
      _submitHandled = false;
    }
  }

  void _handleSubmitted(String text) {
    if (widget.onSubmitted != null) {
      widget.onSubmitted!(text);
    } else if (widget.onFinished != null) {
      widget.onFinished!(text);
      _submitHandled = true;
    }
  }

  void _handleClearField() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.clear();
      if (widget.onChanged != null) widget.onChanged!('');
    });
  }

  void selectAll() {
    final text = _controller.text;
    if (text.isEmpty) return;
    _controller.selection =
        TextSelection(baseOffset: 0, extentOffset: text.length);
  }

  OutlineInputBorder customInputBorder(bool focused) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
          color: focused ? CustomColors.primary : CustomColors.divider,
          width: focused ? 2 : 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final showIconOutsideField =
        widget.type != CustomTextFormFieldType.outlined && widget.icon != null;

    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          if (showIconOutsideField) Icon(widget.icon),
          if (showIconOutsideField) const SizedBox(width: CustomSpacing.medium),
          Expanded(
            child: widget.textField != null
                ? widget.textField!
                : TextFormField(
                    enabled: widget.isEnable,
                    controller: _controller,
                    focusNode: _focusNode,
                    autofillHints: widget.autofillHints,
                    textAlign: widget.textAlign ?? TextAlign.start,
                    maxLength: widget.maxLength,
                    style: TextStyle(
                        fontSize: widget.type == CustomTextFormFieldType.heading
                            ? 16
                            : 14),
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: widget.contentPadding,
                      isDense: widget.isDense,
                      prefixIcon: (widget.icon != null && !showIconOutsideField)
                          ? Icon(widget.icon)
                          : null,
                      labelText: widget.labelText,
                      hintText: widget.hintText,
                      border: widget.type == CustomTextFormFieldType.outlined
                          ? const OutlineInputBorder()
                          : widget.type == CustomTextFormFieldType.underline
                              ? const UnderlineInputBorder()
                              : widget.type == CustomTextFormFieldType.rounded
                                  ? customInputBorder(false)
                                  : InputBorder.none,
                      focusedBorder: widget.type ==
                              CustomTextFormFieldType.outlined
                          ? widget.focusInputBorder == null
                              ? null
                              : widget.focusInputBorder
                          : widget.type == CustomTextFormFieldType.underline
                              ? const UnderlineInputBorder()
                              : widget.type == CustomTextFormFieldType.rounded
                                  ? customInputBorder(true)
                                  : InputBorder.none,
                      enabledBorder: widget.type ==
                              CustomTextFormFieldType.outlined
                          ? widget.enabledInputBorder == null
                              ? null
                              : widget.enabledInputBorder
                          : widget.type == CustomTextFormFieldType.underline
                              ? const UnderlineInputBorder()
                              : widget.type == CustomTextFormFieldType.rounded
                                  ? customInputBorder(false)
                                  : InputBorder.none,
                      disabledBorder:
                          widget.type == CustomTextFormFieldType.outlined
                              ? null
                              : widget.type == CustomTextFormFieldType.rounded
                                  ? null
                                  : InputBorder.none,
                      errorBorder:
                          widget.type == CustomTextFormFieldType.outlined
                              ? null
                              : widget.type == CustomTextFormFieldType.rounded
                                  ? null
                                  : InputBorder.none,
                      suffixIcon: widget.showClearIcon && _controller.text != ''
                          ? IconButton(
                              onPressed: _handleClearField,
                              icon: const Icon(Icons.clear),
                            )
                          : widget.suffix,
                    ),
                    autovalidateMode: widget.activeOnUserInteraction
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    textInputAction:
                        widget.textInputAction ?? TextInputAction.next,
                    textCapitalization: widget.textCapitalization,
                    onChanged: widget.onChanged,
                    onTap: widget.onTap,
                    validator: widget.validator,
                    autofocus: widget.autofocus,
                    readOnly: widget.readOnly,
                    showCursor: widget.showCursor,
                    obscureText: widget.obscureText,
                    enableSuggestions: widget.enableSuggestions,
                    maxLines: widget.maxLines,
                    onFieldSubmitted: widget.onFieldSubmitted,
                    keyboardType: widget.keyboardType,
                    inputFormatters: widget.inputFormatters,
                  ),
          ),
        ],
      ),
    );
  }
}

enum CustomTextFormFieldType { standard, outlined, heading, underline, rounded }
