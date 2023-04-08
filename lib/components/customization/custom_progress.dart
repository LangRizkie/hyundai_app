import "package:flutter/material.dart";
import "package:hyundai_app/modules/theme.dart";

class CustomProgress extends StatefulWidget {
  const CustomProgress({
    Key? key,
    this.value = 0,
    this.height = 4,
    this.width,
    this.backgroundColor = Palette.backgroundSecondaryColor,
    this.color = Palette.secondaryColor,
  }) : super(key: key);

  final double value;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? color;

  @override
  State<CustomProgress> createState() => _CustomProgressState();
}

class _CustomProgressState extends State<CustomProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height,
      color: widget.backgroundColor,
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        width:
            (widget.width ?? MediaQuery.of(context).size.width) * widget.value,
        height: 4,
        color: widget.color,
        duration: const Duration(milliseconds: 100),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}
