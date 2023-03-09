import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/components/layout.dart';
import 'package:hyundai_app/modules/global.dart';
import 'package:hyundai_app/modules/theme.dart';

import 'customization/custom_app_bar.dart';

class OTP extends StatefulWidget {
  const OTP({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  final Function(String value) onSubmit;

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
  bool isRequest = false;

  @override
  void initState() {
    super.initState();

    if (Global.otp > 0) {
      endTime = Global.otp;
      setState(() => isRequest = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: const CustomAppBar(
        title: "OTP Code Verification",
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Gap(
          gap: 20,
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/illustration-otp.png",
              height: 104,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "A code is sent to your email ",
                style: TextStyle(
                  fontFamily: Constant.fontFamilyText,
                  fontSize: 14,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'mut********@gmail.com.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        ' Please check your inbox and copy the OTP Code here.',
                  ),
                ],
              ),
            ),
            OtpTextField(
              numberOfFields: 6,
              autoFocus: true,
              filled: true,
              fillColor: Colors.white,
              cursorColor: Palette.primaryColor,
              focusedBorderColor: Palette.primaryColor,
              fieldWidth: (MediaQuery.of(context).size.width / 6) - 16,
              onSubmit: widget.onSubmit,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: Constant.fontFamilyText,
                  fontSize: 14,
                  color: Colors.black,
                ),
                children: [
                  if (!isRequest)
                    WidgetSpan(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Didn't receive OTP code?",
                            style: TextStyle(
                              fontFamily: Constant.fontFamilyText,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          ScaleTap(
                            child: const Text(
                              " Request OTP",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Palette.primaryColor,
                              ),
                            ),
                            onPressed: () => setState(
                              () => {
                                endTime =
                                    DateTime.now().millisecondsSinceEpoch +
                                        1000 * 60,
                                isRequest = true,
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (isRequest)
                    WidgetSpan(
                      child: CountdownTimer(
                        endTime: endTime,
                        onEnd: () {
                          if (mounted) setState(() => isRequest = false);
                        },
                        widgetBuilder: (context, time) {
                          if (time == null) return const Text("");

                          String times = [
                            "${time.min != null ? time.min! < 10 ? "0${time.min}" : time.min : "00"}",
                            "${time.sec != null ? time.sec! < 10 ? "0${time.sec}" : time.sec : "00"}",
                          ].join(":");

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Request again in "),
                              Text(times),
                            ],
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    if (isRequest) {
      Global.otp = endTime;
    }
  }
}
