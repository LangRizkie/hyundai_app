import 'package:flutter/material.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/components/tags.dart';

class FilterComponent extends StatefulWidget {
  const FilterComponent({
    super.key,
    required this.tags,
    this.activeFilter,
    this.onTagPressed,
  });

  final List<String> tags;
  final String? activeFilter;
  final Function(String value)? onTagPressed;

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Gap(
        gap: 8,
        direction: Axis.horizontal,
        children: List.generate(
          widget.tags.length,
          (index) => Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 16 : 0,
              right: index == widget.tags.length - 1 ? 16 : 0,
            ),
            child: Tag(
              value: widget.tags[index],
              isActive: widget.tags[index] == widget.activeFilter,
              onPressed: (value) => widget.onTagPressed != null
                  ? widget.onTagPressed!(value)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
