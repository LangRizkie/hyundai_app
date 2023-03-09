import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hyundai_app/components/customization/custom_button.dart';
import 'package:hyundai_app/modules/route.dart';
import 'package:hyundai_app/modules/theme.dart';

class SuccessPageScreen extends StatefulWidget {
  const SuccessPageScreen({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  State<SuccessPageScreen> createState() => _SuccessPageScreenState();
}

class _SuccessPageScreenState extends State<SuccessPageScreen> {
  @override
  Widget build(BuildContext context) {
    late String title = widget.title;
    late String description = widget.description;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          color: Palette.backgroundColor,
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/illustration-success.png",
                  height: 72,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 24,
                    bottom: 16,
                  ),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          fontFamily: Constant.fontFamilyText,
                          fontSize: 16,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  label: "Login",
                  textColor: Colors.white,
                  buttonColor: Palette.primaryColor,
                  onPressed: () => Modular.to.navigate(Screens.login),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
