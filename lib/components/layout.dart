import 'package:flutter/material.dart';
import 'package:hyundai_app/components/refresh.dart';
import 'package:hyundai_app/modules/theme.dart';

class Layout extends StatefulWidget {
  const Layout({
    Key? key,
    this.appBar,
    this.resizeToAvoidBottomInset = true,
    this.canRefresh = true,
    this.refreshColor = Palette.backgroundColor,
    required this.child,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  final bool canRefresh;
  final Color? refreshColor;
  final Widget child;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      backgroundColor: Palette.backgroundColor,
      body: Refresh(
        disabled: !widget.canRefresh,
        color: widget.refreshColor,
        onRefresh: Future.delayed(
          const Duration(seconds: 2),
          () => mounted ? setState(() => {}) : null,
        ),
        onLoading: Future.delayed(
          const Duration(seconds: 2),
          () => mounted ? setState(() => {}) : null,
        ),
        child: widget.child,
      ),
    );
  }
}
