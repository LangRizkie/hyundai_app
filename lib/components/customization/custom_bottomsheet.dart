import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    Key? key,
    this.title,
    this.isDismissable = true,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
    required this.children,
  }) : super(key: key);

  final String? title;
  final bool? isDismissable;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final List<Widget> children;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:
              widget.mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment:
              widget.crossAxisAlignment ?? CrossAxisAlignment.center,
          mainAxisSize: widget.mainAxisSize ?? MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      widget.title ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  if (widget.isDismissable ?? false)
                    Positioned(
                      left: 0,
                      child: ScaleTap(
                        onPressed: () => Modular.to.pop(),
                        child: const Icon(Icons.close),
                      ),
                    ),
                ],
              ),
            ),
            ...widget.children
          ],
        ),
      ),
    );
  }
}
