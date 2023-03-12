import 'package:flutter/material.dart';

class Gap extends StatefulWidget {
  const Gap({
    Key? key,
    required this.gap,
    this.disableScroll = false,
    this.direction = Axis.horizontal,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    required this.children,
  }) : super(key: key);

  final double gap;
  final bool disableScroll;
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final List<Widget> children;

  @override
  State<Gap> createState() => _GapState();
}

class _GapState extends State<Gap> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: widget.direction,
      physics: widget.disableScroll
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      child: widget.direction == Axis.vertical ? column() : row(),
    );
  }

  Row row() {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      mainAxisSize: widget.mainAxisSize,
      children: [
        ...widget.children.asMap().entries.map(
              (e) => separator(
                child: widget.children[e.key],
                gap: e.key != widget.children.length - 1 ? widget.gap : 0,
              ),
            ),
      ],
    );
  }

  Column column() {
    return Column(
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      mainAxisSize: widget.mainAxisSize,
      children: [
        ...widget.children.asMap().entries.map(
              (e) => separator(
                child: widget.children[e.key],
                gap: e.key != widget.children.length - 1 ? widget.gap : 0,
              ),
            ),
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
