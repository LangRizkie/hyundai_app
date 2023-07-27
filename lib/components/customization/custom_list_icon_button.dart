import "package:flutter/material.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:hyundai_app/modules/global.dart";
import "package:hyundai_app/modules/theme.dart";

class CustomListIconButton extends StatefulWidget {
  const CustomListIconButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color,
    this.backgroundColor,
    this.prefixIcon,
    this.prefixIconColor = Colors.black,
    this.customPrefixIcon,
    this.suffixIcon = Icons.chevron_right,
    this.suffixIconColor = Colors.black,
    this.customSuffixIcon,
    this.useBottomBorder = true,
  }) : assert(prefixIcon == null || customPrefixIcon == null);

  final Function() onPressed;
  final String label;
  final Color? color;
  final Color? backgroundColor;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final Widget? customPrefixIcon;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final Widget? customSuffixIcon;
  final bool? useBottomBorder;

  @override
  State<CustomListIconButton> createState() => _CustomListIconButtonState();
}

class _CustomListIconButtonState extends State<CustomListIconButton> {
  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      scaleMinValue: Global.scaleMinValue,
      onPressed: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          border:
              widget.useBottomBorder != null && widget.useBottomBorder == true
                  ? const Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Palette.backgroundSecondaryColor,
                      ),
                    )
                  : null,
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
                if (widget.customPrefixIcon != null)
                  widget.customPrefixIcon as Widget,
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.color ?? Colors.black,
                  ),
                ),
              ],
            ),
            if (widget.suffixIcon != null && widget.customSuffixIcon == null)
              Icon(
                widget.suffixIcon,
                size: 22,
                color: widget.suffixIconColor,
              ),
            if (widget.customSuffixIcon != null)
              widget.customSuffixIcon as Widget
          ],
        ),
      ),
    );
  }
}
