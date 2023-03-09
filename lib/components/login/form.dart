import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hyundai_app/components/customization/custom_button.dart';
import 'package:hyundai_app/components/labeled_textformfield.dart';
import 'package:hyundai_app/modules/global.dart';
import 'package:hyundai_app/modules/route.dart';
import 'package:hyundai_app/modules/theme.dart';
import 'package:text_divider/text_divider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.show,
    required this.onVisibilityPressed,
    required this.onForgotPasswordPressed,
  }) : super(key: key);

  final bool show;
  final Function() onVisibilityPressed;
  final Function() onForgotPasswordPressed;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          LabeledTextFormField(
            label: "Email",
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Input email",
              ),
            ),
          ),
          LabeledTextFormField(
            label: "Password",
            child: TextFormField(
              obscureText: !widget.show,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Input password",
                suffixIconColor: Colors.black,
                suffixIcon: ScaleTap(
                  onPressed: widget.onVisibilityPressed,
                  child: Icon(
                    widget.show
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ScaleTap(
                  onPressed: widget.onForgotPasswordPressed,
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
            label: "Login",
            textColor: Colors.white,
            buttonColor: Palette.primaryColor,
            onPressed: () {
              Global.isLoggedIn = true;
              Global.loadingOverlay(
                context,
                text: "Please wait...",
              );
              Future.delayed(const Duration(seconds: 2)).then((value) {
                Modular.to.pop();
                Modular.to.navigate(Screens.home);
              });
            },
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: TextDivider.horizontal(
              thickness: 1,
              text: const Text('Not a member?'),
            ),
          ),
          CustomButton(
            label: "Register",
            textColor: Colors.white,
            buttonColor: Palette.secondaryColor,
            onPressed: () => Modular.to.pushNamed(Screens.register),
          ),
        ],
      ),
    );
  }
}
