import 'package:flutter/material.dart';
import 'package:hyundai_app/modules/global.dart';
import 'package:hyundai_app/components/refresh.dart';

class Layout extends StatefulWidget {
  const Layout({
    Key? key,
    this.appBar,
    this.resizeToAvoidBottomInset = true,
    required this.child,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
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
      body: Refresh(
        disabled: !Global.canRefresh,
        color: Global.refreshBackgroundColor,
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
