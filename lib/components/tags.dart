import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hyundai_app/modules/theme.dart';

class Tag extends StatefulWidget {
  const Tag({
    super.key,
    required this.value,
    this.isActive = false,
    this.onPressed,
  });

  final String value;
  final bool isActive;
  final Function(String value)? onPressed;

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () =>
          widget.onPressed != null ? widget.onPressed!(widget.value) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: widget.isActive
              ? Palette.primaryColor
              : Palette.backgroundSecondaryColor,
          borderRadius: BorderRadius.circular(96),
        ),
        child: Text(
          widget.value,
          style: TextStyle(
            fontFamily: Constant.fontFamilyText,
            color: widget.isActive ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
