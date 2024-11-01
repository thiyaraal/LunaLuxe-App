import 'package:flutter/material.dart';
import 'package:submission_first/style/color_style.dart';
import 'package:submission_first/style/font_style.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const ButtonWidget({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            //shadowColor: ColorStyle.primaryColor,
            shadowColor: ColorStyle.blackColor,
            elevation: 10,
            backgroundColor: ColorStyle.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            title,
            style: FontFamily.textButton,
          ),
        ),
      ),
    );
  }
}
