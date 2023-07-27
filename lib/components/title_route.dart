import "package:flutter/material.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:hyundai_app/modules/theme.dart";

class TitleRoute extends StatefulWidget {
  const TitleRoute({
    Key? key,
    required this.title,
    this.description,
    this.fontSize,
    this.action,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String? description;
  final double? fontSize;
  final bool? action;
  final void Function()? onPressed;

  @override
  State<TitleRoute> createState() => _TitleRouteState();
}

class _TitleRouteState extends State<TitleRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: widget.fontSize ?? 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (widget.action != null)
                ScaleTap(
                  onPressed: widget.onPressed,
                  child: const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 2,
                    children: [
                      Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Palette.primaryColor,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 16,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          if (widget.description != null)
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: Text(
                widget.description!,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
