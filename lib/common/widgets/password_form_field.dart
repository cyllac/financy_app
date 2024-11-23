import 'dart:developer';

import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;

  const PasswordFormField({
    super.key,
    this.controller,
    this.padding,
    this.hintText,
    this.labelText,
    this.textCapitalization,
    this.keyboardType,
    this.maxLength,
    this.textInputAction,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: isHidden,
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      suffixIcon: InkWell(
        borderRadius: BorderRadius.circular(23.0),
        child: Icon(isHidden ? Icons.visibility : Icons.visibility_off),
        onTap: () {
          log("pressed");
          setState(() {
            isHidden = !isHidden;
          });
        },
      ),
    );
  }
}
