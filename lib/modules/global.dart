library my_prj.globals;

import 'package:flutter/material.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/modules/theme.dart';

class Global {
  static bool isLoggedIn = false;
  static bool canRefresh = false;
  static int otp = 0;

  static Color refreshBackgroundColor = Palette.backgroundColor;

  static Future loadingOverlay(BuildContext context, {String? text}) {
    return showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: false,
      barrierColor: Colors.black87,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SizedBox(
            width: double.infinity,
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
}
