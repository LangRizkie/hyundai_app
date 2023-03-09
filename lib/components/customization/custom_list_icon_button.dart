import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hyundai_app/modules/theme.dart';

class CustomListIconButton extends StatefulWidget {
  const CustomListIconButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.prefixIcon,
    this.prefixIconColor = Colors.black,
    this.suffixIcon,
    this.suffixIconColor = Colors.black,
  }) : super(key: key);

  final Function() onPressed;
  final String label;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final IconData? suffixIcon;
  final Color? suffixIconColor;

  @override
  State<CustomListIconButton> createState() => _CustomListIconButtonState();
}

class _CustomListIconButtonState extends State<CustomListIconButton> {
  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      scaleMinValue: 0.99,
      onPressed: () {
        Modular.to.pop();
        widget.onPressed();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Palette.backgroundSecondaryColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (widget.prefixIcon != null)
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: Icon(
                      widget.prefixIcon,
                      size: 22,
                      color: widget.prefixIconColor,
                    ),
                  ),
                Text(
                  widget.label,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            if (widget.suffixIcon != null)
              Icon(
                widget.suffixIcon,
                size: 22,
                color: widget.suffixIconColor,
              ),
          ],
        ),
      ),
    );
  }
}
