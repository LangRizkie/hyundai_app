import "package:flutter/material.dart";
import "package:badges/badges.dart" as badges;
import "package:hyundai_app/modules/theme.dart";

class IconBadge extends StatefulWidget {
  const IconBadge({
    Key? key,
    this.showBadge = false,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final bool showBadge;
  final Icon icon;
  final void Function() onPressed;

  @override
  State<IconBadge> createState() => _IconBadgeState();
}

class _IconBadgeState extends State<IconBadge> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: 12, end: 12),
        badgeStyle: const badges.BadgeStyle(
          badgeColor: Palette.secondaryColor,
        ),
        showBadge: widget.showBadge,
        child: IconButton(
          icon: widget.icon,
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}
