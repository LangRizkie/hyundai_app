import "package:flutter/material.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:hyundai_app/modules/global.dart";

class Expandable extends StatefulWidget {
  const Expandable({
    super.key,
    required this.title,
    this.onPressed,
    this.children,
  });

  final String title;
  final Function()? onPressed;
  final List<Widget>? children;

  @override
  State<Expandable> createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> {
  bool isOpen = false;

  onPressed() {
    setState(() => isOpen = !isOpen);
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScaleTap(
            scaleMinValue: Global.scaleMinValue,
            onPressed: onPressed,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: isOpen ? 2 : 0,
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
          ),
          if (widget.children != null && isOpen) ...widget.children!
        ],
      ),
    );
  }
}
