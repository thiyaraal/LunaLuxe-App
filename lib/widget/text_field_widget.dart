import 'package:flutter/material.dart';
import 'package:submission_first/style/color_style.dart';
import 'package:submission_first/style/font_style.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final bool showError;
  final String errorText;
  final Function(String) onChanged;
  final VoidCallback onEditingComplete;
  final Widget? suffixIcon;
  final bool obscureText;

  const TextFieldWidget(
      {super.key,
      this.suffixIcon,
      this.obscureText = false,
      required this.controller,
      required this.focusNode,
      required this.hintText,
      required this.showError,
      required this.errorText,
      required this.onChanged,
      required this.onEditingComplete});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final bool _isObscured =false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
         obscureText: widget.obscureText ? !_isObscured : false,
            controller: widget.controller,
            focusNode: widget.focusNode,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              filled: true,
              fillColor: ColorStyle.whiteColor,
              hintText: widget.hintText,
              hintStyle: FontFamily.textFieldText,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              errorText: widget.showError ? widget.errorText : null,
            ),
            onEditingComplete: widget.onEditingComplete,
          ),
        ),
      ),
    );
  }
}
