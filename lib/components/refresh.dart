import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hyundai_app/modules/theme.dart';
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

class _RefreshState extends State<Refresh> with TickerProviderStateMixin {
  final RefreshController refreshController = RefreshController();

  late AnimationController animationController;

  late AnimationController scaleController;

  @override
  void initState() {
    if (mounted) {
      refreshController.headerMode!.addListener(headerModeListener);

      animationController = AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this,
      );

      scaleController = AnimationController(
        value: 0,
        vsync: this,
        upperBound: 1,
      );
    }

    super.initState();
  }

  void headerModeListener() {
    if (refreshController.headerStatus == RefreshStatus.idle) {
      scaleController.value = 0.0;
      animationController.reset();
    } else if (refreshController.headerStatus == RefreshStatus.refreshing) {
      animationController.repeat();
    }
  }

  void onRefresh() async {
    await widget.onRefresh;
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await widget.onLoading;
    refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.disabled) return widget.child;

    return SmartRefresher(
      enablePullUp: widget.disabled ? !widget.disabled : widget.enablePullUp,
      enablePullDown:
          widget.disabled ? !widget.disabled : widget.enablePullDown,
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoading,
      header: customHeader(),
      child: widget.child,
    );
  }

  customHeader() {
    return CustomHeader(
      refreshStyle: RefreshStyle.Behind,
      onOffsetChange: (offset) {
        if (refreshController.headerMode!.value != RefreshStatus.refreshing) {
          scaleController.value = offset / 80;
        }
      },
      builder: (context, mode) => Container(
        alignment: Alignment.center,
        color: widget.color,
        child: FadeTransition(
          opacity: scaleController,
          child: ScaleTransition(
            scale: scaleController,
            child: SpinKitRotatingPlain(
              controller: animationController,
              size: 24,
              itemBuilder: (spinContext, index) => DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven
                      ? Palette.secondaryColor
                      : Palette.backgroundColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    refreshController.dispose();
    scaleController.dispose();
    animationController.dispose();
    super.dispose();
  }
}
