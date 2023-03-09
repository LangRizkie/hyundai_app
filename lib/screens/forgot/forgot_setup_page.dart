import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hyundai_app/components/customization/custom_app_bar.dart';
import 'package:hyundai_app/components/customization/custom_button.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/components/labeled_textformfield.dart';
import 'package:hyundai_app/components/layout.dart';
import 'package:hyundai_app/modules/generic.dart';
import 'package:hyundai_app/modules/route.dart';
import 'package:hyundai_app/modules/theme.dart';

class ForgotSetupPageScreen extends StatefulWidget {
  const ForgotSetupPageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotSetupPageScreen> createState() => _ForgotSetupPageScreenState();
}

class _ForgotSetupPageScreenState extends State<ForgotSetupPageScreen> {
  TextEditingController password = TextEditingController();
  bool showPassword = false;
  bool showConfirmationPassword = false;

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: const CustomAppBar(
        title: "Setup New Password",
      ),
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        color: Palette.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: Column(
                children: [
                  LabeledTextFormField(
                    label: "New Password",
                    child: TextFormField(
                      controller: password,
                      obscureText: !showPassword,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) => setState(() {}),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Input password",
                        suffixIconColor: Colors.black,
                        suffixIcon: ScaleTap(
                          onPressed: () =>
                              setState(() => showPassword = !showPassword),
                          child: Icon(
                            showPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Gap(
                      gap: 8,
                      direction: Axis.vertical,
                      children: [
                        FlutterPasswordStrength(
                          password: password.value.text,
                          radius: 10,
                          height: 4,
                        ),
                        const Text(
                          "Min 1 uppercase, 1 lowercase, special character",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  LabeledTextFormField(
                    label: "Confirm Password",
                    child: TextFormField(
                      obscureText: !showConfirmationPassword,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Confirm your password",
                        suffixIconColor: Colors.black,
                        suffixIcon: ScaleTap(
                          onPressed: () => setState(
                            () => showConfirmationPassword =
                                !showConfirmationPassword,
                          ),
                          child: Icon(
                            showConfirmationPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    label: "Setup New Password",
                    textColor: Colors.white,
                    buttonColor: Palette.primaryColor,
                    onPressed: () => Modular.to.navigate(
                      Screens.success,
                      arguments: ResultPageType(
                        title: "Password Reset Successfully",
                        description:
                            "Login now to continue using the application",
                      ).toJson(),
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
}
