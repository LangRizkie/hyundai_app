import 'package:flutter/material.dart';

class Gap extends StatefulWidget {
  const Gap({
    Key? key,
    required this.gap,
    this.direction = Axis.horizontal,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    required this.children,
  }) : super(key: key);

  final double gap;
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;

  @override
  State<Gap> createState() => _GapState();
}

class _GapState extends State<Gap> {
  @override
  Widget build(BuildContext context) {
    final direction = widget.direction == Axis.horizontal ? row() : column();
    return direction;
  }

  Row row() {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      children: [
        ...widget.children.asMap().entries.map((e) => separator(
            child: widget.children[e.key],
            gap: e.key != widget.children.length - 1 ? widget.gap : 0))
      ],
    );
  }

  Column column() {
    return Column(
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      children: [
        ...widget.children.asMap().entries.map((e) => separator(
            child: widget.children[e.key],
            gap: e.key != widget.children.length - 1 ? widget.gap : 0))
      ],
    );
  }

  Widget separator({required Widget child, double? gap}) {
    return Container(
      margin: EdgeInsets.only(
        right: widget.direction == Axis.horizontal ? gap ?? 0 : 0,
        bottom: widget.direction == Axis.vertical ? gap ?? 0 : 0,
      ),
      child: child,
    );
  }
}
