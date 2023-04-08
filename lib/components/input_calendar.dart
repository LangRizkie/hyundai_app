import "package:flutter/material.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:intl/intl.dart";

class InputCalendar extends StatefulWidget {
  const InputCalendar({
    Key? key,
    required this.onPressed,
    required this.value,
  }) : super(key: key);

  final Function() onPressed;
  final DateTime value;

  @override
  State<InputCalendar> createState() => _InputCalendarState();
}

class _InputCalendarState extends State<InputCalendar> {
  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: widget.onPressed,
      scaleMinValue: 0.99,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(14),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat("yyyy MM dd").format(widget.value),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const Icon(
              Icons.calendar_today,
              size: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
