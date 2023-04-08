import "package:flutter/material.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:hyundai_app/modules/theme.dart";

class Tag extends StatefulWidget {
  const Tag({
    super.key,
    required this.value,
    this.isActive = false,
    this.isCircular = false,
    this.textColor,
    this.color,
    this.onPressed,
  });

  final String value;
  final bool isActive;
  final bool isCircular;
  final Color? textColor;
  final Color? color;
  final Function(String value)? onPressed;

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: widget.onPressed != null
          ? () => widget.onPressed!(widget.value)
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: widget.color ??
              (widget.isActive
                  ? Palette.primaryColor
                  : Palette.backgroundSecondaryColor),
          borderRadius:
              widget.isCircular ? BorderRadius.circular(96) : BorderRadius.zero,
        ),
        child: Text(
          widget.value,
          style: TextStyle(
            fontFamily: Constant.fontFamilyText,
            color: widget.textColor ??
                (widget.isActive ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
