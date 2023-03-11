import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hyundai_app/components/customization/custom_bottomsheet.dart';
import 'package:hyundai_app/components/customization/custom_list_icon_button.dart';
import 'package:hyundai_app/components/login/form.dart';
import 'package:hyundai_app/modules/generic.dart';
import 'package:hyundai_app/modules/route.dart';
import 'package:hyundai_app/components/layout.dart';
import 'package:hyundai_app/components/login/hero_text.dart';
import 'package:hyundai_app/modules/theme.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  bool show = false;

  onVisibilityPressed() => setState(() => show = !show);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Palette.backgroundColor,
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeroText(),
                LoginForm(
                  show: show,
                  onVisibilityPressed: onVisibilityPressed,
                  onForgotPasswordPressed: onForgotPasswordPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onForgotPasswordPressed() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomBottomSheet(
        title: "Forgot Password",
        children: [
          CustomListIconButton(
            prefixIcon: Icons.email_outlined,
            label: "Reset by Email",
            onPressed: () {
              Modular.to.pop();
              Modular.to.pushNamed(
                Screens.forgot,
                arguments: TitlePageType(title: "Email").toJson(),
              );
            },
          ),
          CustomListIconButton(
            prefixIcon: Icons.smartphone,
            label: "Reset by Message",
            onPressed: () {
              Modular.to.pop();
              Modular.to.pushNamed(
                Screens.forgot,
                arguments: TitlePageType(title: "Phone").toJson(),
              );
            },
          ),
        ],
      ),
    );
  }
}
