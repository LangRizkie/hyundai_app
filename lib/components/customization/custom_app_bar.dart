import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hyundai_app/components/icon_badge.dart';
import 'package:hyundai_app/modules/theme.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.isMain = false,
    this.isTransparent = false,
    this.title,
    this.overrideBackButton,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  final bool? isMain;
  final bool? isTransparent;
  final String? title;
  final Function()? overrideBackButton;

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
          onPressed: () {},
        ),
        actions: [
          IconBadge(
            showBadge: true,
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
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
        ),
      ),
      backgroundColor:
          widget.isTransparent! ? Colors.transparent : Colors.white,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: widget.overrideBackButton ?? () => Modular.to.pop(),
      ),
    );
  }
}
