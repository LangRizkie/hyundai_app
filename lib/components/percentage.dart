import 'package:flutter/material.dart';
import 'package:hyundai_app/modules/theme.dart';

class Percentage extends StatefulWidget {
  const Percentage({
    Key? key,
    this.percentage = 0,
  }) : super(key: key);

  final int percentage;

  @override
  State<Percentage> createState() => _PercentageState();
}

class _PercentageState extends State<Percentage> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Palette.primaryColor,
        ),
        children: [
          TextSpan(
            text: widget.percentage.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const TextSpan(
            text: '%',
          )
        ],
      ),
    );
  }
}
