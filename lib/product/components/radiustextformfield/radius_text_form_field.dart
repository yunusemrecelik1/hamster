// ignore_for_file: must_be_immutable, unnecessary_null_in_if_null_operators, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamster/core/init/theme/color_palette.dart';

class RadiusFormFieldWidget extends StatefulWidget {
  TextEditingController? controller;
  String validateText;
  bool suffix = false;
  double? suffixIconSize;
  double? fontSize;
  Color? color;
  String? savedString;
  String? initialText;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;

  TextAlignVertical? textAlignVertical;
  RadiusFormFieldWidget({
    Key? key,
    this.controller,
    this.suffix = false,
    this.validateText = "Boş Olamaz",
    this.fontSize,
    this.color,
    this.suffixIconSize,
    this.initialText,
    this.keyboardType,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<RadiusFormFieldWidget> createState() => _RadiusFormFieldWidgetState();
}

class _RadiusFormFieldWidgetState extends State<RadiusFormFieldWidget> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: widget.controller,
      validator: (onValidateVal) {
        if (onValidateVal!.isEmpty) {
          return widget.validateText;
        }
        return null;
      },
      onSaved: (onSavedVal) => {
        widget.savedString = onSavedVal,
      },
      keyboardType: widget.keyboardType ?? null,
      inputFormatters: widget.inputFormatters ?? null,
      obscureText: _obscureText,
      textAlignVertical: widget.textAlignVertical ?? TextAlignVertical.center,
      style: TextStyle(
        color: widget.color ?? Colors.black,
        fontSize: widget.fontSize ?? 12,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: widget.initialText ?? "",
        contentPadding: const EdgeInsets.all(8),
        filled: true,
        fillColor: ColorPalette.instance.textfieldBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: ColorPalette.instance.textFieldBorderColor,
            width: 1.5,
          ),
        ),
        suffixIcon: widget.suffix
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: widget.color ?? Colors.black,
                  size: widget.suffixIconSize ?? 15,
                ),
              )
            : null,
      ),
    );
  }
}
