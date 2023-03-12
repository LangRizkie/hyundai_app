import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hyundai_app/components/customization/custom_app_bar.dart';
import 'package:hyundai_app/components/customization/custom_button.dart';
import 'package:hyundai_app/components/labeled_textformfield.dart';
import 'package:hyundai_app/components/layout.dart';
import 'package:hyundai_app/components/otp.dart';
import 'package:hyundai_app/modules/global.dart';
import 'package:hyundai_app/modules/route.dart';
import 'package:hyundai_app/modules/theme.dart';

class ForgotPageScreen extends StatefulWidget {
  const ForgotPageScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<ForgotPageScreen> createState() => _ForgotPageScreenState();
}

class _ForgotPageScreenState extends State<ForgotPageScreen> {
  late bool isEmail;
  late String placeholder;

  @override
  void initState() {
    isEmail = widget.title.toLowerCase() == "email";
    placeholder = isEmail ? widget.title : "Phone Number";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      canRefresh: false,
      appBar: CustomAppBar(
        title: "Reset By ${widget.title}",
      ),
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        color: Palette.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "To set up your new password please input your ${widget.title}.",
              style: const TextStyle(
                fontFamily: Constant.fontFamilyText,
                fontSize: 14,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 16,
              ),
              child: Form(
                child: Column(
                  children: [
                    LabeledTextFormField(
                      label: placeholder,
                      child: TextFormField(
                        keyboardType: isEmail
                            ? TextInputType.emailAddress
                            : TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Input $placeholder",
                        ),
                      ),
                    ),
                    CustomButton(
                      label: "Verify",
                      textColor: Colors.white,
                      buttonColor: Palette.primaryColor,
                      onPressed: onVerify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onVerify() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => OTP(
        onSubmit: (value) {
          Global.loadingOverlay(
            context,
            text: "Please wait, validate OTP Code",
          );
          Future.delayed(const Duration(seconds: 2)).then((value) {
            Modular.to.pop();
            Modular.to.pop();
            Modular.to.pushNamed(Screens.forgotSetup);
          });
        },
      ),
    );
  }
}
