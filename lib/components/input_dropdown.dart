import "package:flutter/material.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:hyundai_app/modules/global.dart";

class InputDropdown extends StatefulWidget {
  const InputDropdown({
    Key? key,
    required this.onPressed,
    this.placeholder,
    this.color = Colors.white,
    this.value,
  }) : super(key: key);

  final Function() onPressed;
  final String? placeholder;
  final Color? color;
  final String? value;

  @override
  State<InputDropdown> createState() => _InputDropdownState();
}

class _InputDropdownState extends State<InputDropdown> {
  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: widget.onPressed,
      scaleMinValue: Global.scaleMinValue,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(14),
        color: widget.color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.value ?? widget.placeholder ?? "Select",
              style: TextStyle(
                fontSize: 16,
                color: widget.value == null ? Colors.black54 : Colors.black,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
