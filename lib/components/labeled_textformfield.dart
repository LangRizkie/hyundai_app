import 'package:flutter/material.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/modules/theme.dart';

class LabeledTextFormField extends StatefulWidget {
  const LabeledTextFormField({
    Key? key,
    required this.label,
    required this.child,
    this.informationLabel,
  }) : super(key: key);

  final String label;
  final Widget child;
  final String? informationLabel;

  @override
  State<LabeledTextFormField> createState() => _LabeledTextFormFieldState();
}

class _LabeledTextFormFieldState extends State<LabeledTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Gap(
        gap: 8,
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          widget.child,
          if (widget.informationLabel != null)
            Gap(
              gap: 4,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.info_rounded,
                  size: 16,
                  color: Palette.secondaryColor,
                ),
                Text(
                  widget.informationLabel ?? "",
                  style: const TextStyle(
                    fontFamily: Constant.fontFamilyText,
                    fontSize: 12,
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}
