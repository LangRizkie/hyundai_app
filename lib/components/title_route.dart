import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class TitleRoute extends StatefulWidget {
  const TitleRoute({
    Key? key,
    required this.title,
    this.action,
    this.onPressed,
  }) : super(key: key);

  final String title;
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (widget.action != null)
            ScaleTap(
              onPressed: widget.onPressed,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 2,
                children: const [
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 16,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
