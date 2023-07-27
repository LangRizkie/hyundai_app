import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:hyundai_app/components/icon_badge.dart";
import "package:hyundai_app/modules/route.dart";
import "package:hyundai_app/modules/theme.dart";

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.isMain = false,
    this.isTransparent = false,
    this.title,
    this.leadingColor = Colors.black,
    this.overrideBackButton,
    this.actions,
    this.bottom,
  })  : preferredSize = Size.fromHeight(
          kToolbarHeight + (bottom != null ? bottom.preferredSize.height : 0),
        ),
        super(key: key);

  @override
  final Size preferredSize;
  final bool? isMain;
  final bool? isTransparent;
  final String? title;
  final Color? leadingColor;
  final Function()? overrideBackButton;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    if (widget.isMain!) {
      return AppBar(
        title: Text(widget.title ?? ""),
        backgroundColor:
            widget.isTransparent! ? Colors.transparent : Palette.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.qr_code),
          onPressed: () => Modular.to.pushNamed(Screens.scanner),
        ),
        actions: [
          IconBadge(
            showBadge: true,
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => Modular.to.pushNamed(Screens.notification),
          ),
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {},
          )
        ],
      );
    }

    return AppBar(
      title: Text(
        widget.title ?? "",
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor:
          widget.isTransparent! ? Colors.transparent : Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: widget.leadingColor,
        ),
        onPressed: widget.overrideBackButton ?? () => Modular.to.pop(),
      ),
      actions: widget.actions,
      bottom: widget.bottom,
    );
  }
}
