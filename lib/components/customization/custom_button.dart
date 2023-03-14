import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.width,
    this.textColor,
    this.buttonColor,
  }) : super(key: key);

  final String label;
  final double? width;
  final Color? textColor;
  final Color? buttonColor;
  final Function() onPressed;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: TextButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 14,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            widget.buttonColor ?? Colors.transparent,
          ),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: widget.textColor ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
