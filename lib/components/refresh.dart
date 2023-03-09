import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Refresh extends StatefulWidget {
  const Refresh({
    Key? key,
    this.onRefresh,
    this.onLoading,
    this.disabled = false,
    this.enablePullUp = false,
    this.enablePullDown = true,
    this.color,
    required this.child,
  }) : super(key: key);

  final Future<void>? onRefresh;
  final Future<void>? onLoading;
  final bool disabled;
  final bool enablePullUp;
  final bool enablePullDown;
  final Color? color;
  final Widget child;

  @override
  State<Refresh> createState() => _RefreshState();
}

class _RefreshState extends State<Refresh> {
  final RefreshController _refreshController = RefreshController();

  void _onRefresh() async {
    await widget.onRefresh;
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await widget.onLoading;
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: SmartRefresher(
        physics: widget.disabled
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        enablePullUp: widget.disabled ? !widget.disabled : widget.enablePullUp,
        enablePullDown:
            widget.disabled ? !widget.disabled : widget.enablePullDown,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        header: const ClassicHeader(),
        child: widget.child,
      ),
    );
  }
}
