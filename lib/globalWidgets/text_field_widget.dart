import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;


  const CustomTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.maxLines,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      maxLines: maxLines,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      style: TextStyle(
        fontFamily: 'Raleway',
      ),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          fontFamily: 'RaleWay',
          color: Colors.black,
        ),
        focusColor: Colors.black,
        focusedBorder:  const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            // Set the color you want when the field is focused
            width: 1.0, // Set the width of the border side
          ),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),

    );
  }
}
