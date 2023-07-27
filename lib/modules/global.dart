library my_prj.globals;

import "package:flutter/material.dart";
import "package:hyundai_app/components/customization/custom_button.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/modules/theme.dart";

class Global {
  static bool isLoggedIn = false;
  static int otp = 0;
  static double scaleMinValue = 0.99;
  static double underToolbarHeight = kToolbarHeight + 24;

  static loadingOverlay(BuildContext context, {String? text}) {
    return showDialog(
      context: context,
      useSafeArea: false,
      useRootNavigator: true,
      barrierDismissible: false,
      barrierColor: Colors.black87,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Center(
            child: Gap(
              gap: 32,
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                if (text != null)
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }

  static alert(
    BuildContext context, {
    String? title,
    String? description,
    String? cancelLabel,
    String? confirmLabel,
    Function()? onCancel,
    Function()? onConfirm,
  }) {
    return showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: true,
      barrierColor: Colors.black87,
      builder: (context) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Gap(
                    gap: 8,
                    direction: Axis.vertical,
                    children: [
                      if (title != null)
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      if (description != null)
                        Text(
                          description,
                          style: const TextStyle(
                            fontFamily: Constant.fontFamilyText,
                            fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        label: cancelLabel ?? "No",
                        textColor: Palette.primaryColor,
                        buttonColor: Colors.white,
                        onPressed: onCancel ?? () => {},
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        label: confirmLabel ?? "Yes",
                        textColor: Palette.primaryColor,
                        buttonColor: Colors.white,
                        onPressed: onConfirm ?? () => {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
