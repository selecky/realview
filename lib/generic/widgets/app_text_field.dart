import 'package:flutter/material.dart';
import 'package:realview/architecture/app.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.title,
    this.focusNode,
    this.width,
    this.errorText,
    this.suffixWidget,
    this.keyboardType,
    this.onChanged,
  });

  final TextEditingController controller;
  final String title;
  final FocusNode? focusNode;
  final double? width;
  final String? errorText;
  final Widget? suffixWidget;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        autofocus: true,
        keyboardType: keyboardType,
        onChanged: onChanged,
        cursorColor: Theme.of(context).app_textColor,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).app_textColor, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: App.appTheme.app_textColor, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
          suffixIconConstraints: const BoxConstraints(minWidth: 24, minHeight: 24),
          suffixIcon: suffixWidget,
          labelText: title,
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          errorText: errorText,
        ),
      ),
    );
  }
}
