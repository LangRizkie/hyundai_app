import 'package:flutter/material.dart';

class LabeledTextFormField extends StatefulWidget {
  const LabeledTextFormField({
    Key? key,
    required this.label,
    required this.child,
  }) : super(key: key);

  final String label;
  final Widget child;

  @override
  State<LabeledTextFormField> createState() => _LabeledTextFormFieldState();
}

class _LabeledTextFormFieldState extends State<LabeledTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: Text(
              widget.label,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
