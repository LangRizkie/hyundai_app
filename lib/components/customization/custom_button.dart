import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.width,
    this.textColor,
    this.prefixIcon,
    this.suffixIcon,
    this.buttonColor,
  }) : assert(prefixIcon == null || suffixIcon == null);

  final String label;
  final double? width;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? textColor;
  final Color? buttonColor;
  final Function() onPressed;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late Widget icon;
  late Text value = Text(
    widget.label,
    style: TextStyle(
      fontWeight: FontWeight.w400,
      color: widget.textColor ?? Colors.black,
    ),
  );

  @override
  Widget build(BuildContext context) {
    icon = widget.prefixIcon ?? value;

    if (widget.prefixIcon == null && widget.suffixIcon == null) {
      icon = const SizedBox.shrink();
    }

    if (widget.prefixIcon != null || widget.suffixIcon != null) {
      return SizedBox(
        width: widget.width ?? double.infinity,
        child: TextButton.icon(
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
          icon: icon,
          label: widget.suffixIcon ?? value,
        ),
      );
    }

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
        child: value,
      ),
    );
  }
}
