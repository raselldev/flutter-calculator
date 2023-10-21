import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;

  const CustomButton({Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.0,
      height: 70.0,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.5),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: int.tryParse(buttonText) != null ? 16.0 : 14.00,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}