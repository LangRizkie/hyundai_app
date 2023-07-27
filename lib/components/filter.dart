import "package:flutter/material.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/components/tag.dart";

class Filter extends StatefulWidget {
  const Filter({
    super.key,
    required this.tags,
    this.activeFilter,
    this.onTagPressed,
  });

  final List<String> tags;
  final String? activeFilter;
  final Function(String value)? onTagPressed;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
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
              isCircular: true,
              value: widget.tags[index],
              isActive: widget.tags[index] == widget.activeFilter,
              onPressed: widget.onTagPressed,
            ),
          ),
        ),
      ),
    );
  }
}
