// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/theme.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool? obsecure;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final ValueChanged<String>? onChanged;
  final bool? isMulti;
  final bool? autofocus;
  final bool? enabled;
  final String? errorText;
  final String? label;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? minLine;
  final int? maxLength;
  final double? radius;
  final TextInputAction? action;
  final Color? borderColor;
  final Color? fillColor;
  final bool? isFilled;
  const CustomTextField({
    Key? key,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.obsecure,
    this.onTap,
    this.isMulti = false,
    this.readOnly = false,
    this.autofocus = false,
    this.errorText,
    this.label,
    this.maxLength,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled = true,
    this.onEditingCompleted,
    this.onChanged,
    this.minLine,
    this.radius = 16,
    this.action,
    this.borderColor,
    this.fillColor,
    this.isFilled = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      enabled: widget.enabled,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingCompleted,
      controller: widget.controller,
      maxLines: null,
      minLines: widget.minLine,
      validator: widget.validator,
      textInputAction: widget.action,
      readOnly: widget.readOnly ?? false,
      style: textStyle14,
      // obscureText: widget.obsecure! ? true : false,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: textStyle14.copyWith(
          color: otherGrey,
          fontSize: 14,
        ),
        fillColor: widget.fillColor,
        filled: widget.isFilled,
        contentPadding: const EdgeInsets.all(10),
        border: outlineInputBorder.copyWith(
          borderRadius: BorderRadius.circular(widget.radius!),
          borderSide: BorderSide(
            color: isDark ? darkGrey : grey,
          ),
        ),
        enabledBorder: outlineInputBorder.copyWith(
          borderRadius: BorderRadius.circular(widget.radius!),
          borderSide: BorderSide(
            color: isDark ? darkGrey : grey,
          ),
        ),
        focusedBorder: outlineInputBorder.copyWith(
          borderRadius: BorderRadius.circular(widget.radius!),
          borderSide: BorderSide(
            color: isDark ? darkGrey : grey,
          ),
        ),
      ),
    );
  }
}
