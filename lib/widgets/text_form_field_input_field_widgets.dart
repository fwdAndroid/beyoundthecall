import 'package:beyoundthecall/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormInputFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPass;
  final String hintText;
  final TextStyle? hintStyle;
  final TextInputType textInputType;
  final Widget? preIcon;
  final Widget? suIcon;

  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator? validat;
  final List<TextInputFormatter>? inputFormatters;
  final String? error;
  final int? maxLines;

  const TextFormInputFormField(
      {Key? key,
      required this.controller,
      this.isPass = false,
      this.preIcon,
      this.suIcon,
      this.onFieldSubmitted,
      this.hintStyle,
      this.onChanged,
      this.error,
      this.maxLines,
      this.onTap,
      this.autovalidateMode,
      this.inputFormatters,
      this.validat,
      required this.hintText,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(blurRadius: 0.2, spreadRadius: 0.5, color: mainColor)
        ],
        color: mainColor,
      ),
      margin: const EdgeInsets.only(left: 8, right: 8),
      width: 335,
      height: 65,
      child: TextFormField(
        style: TextStyle(color: textColor),
        onFieldSubmitted: onFieldSubmitted,
        maxLines: maxLines,
        onTap: onTap,
        autovalidateMode: autovalidateMode,
        inputFormatters: inputFormatters,
        validator: validat,
        onChanged: onChanged,
        keyboardType: textInputType,
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: suIcon,
            prefixIcon: preIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            border: InputBorder.none,
            fillColor: fieldColor,
            filled: true,
            labelStyle: TextStyle(color: fieldtextColor),
            hintText: hintText,
            hintStyle: TextStyle(color: fieldtextColor)),
      ),
    );
  }
}
