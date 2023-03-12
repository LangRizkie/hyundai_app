import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hyundai_app/components/customization/custom_app_bar.dart';
import 'package:hyundai_app/components/customization/custom_button.dart';
import 'package:hyundai_app/components/customization/custom_progress.dart';
import 'package:hyundai_app/components/layout.dart';
import 'package:hyundai_app/components/otp.dart';
import 'package:hyundai_app/modules/generic.dart';
import 'package:hyundai_app/modules/global.dart';
import 'package:hyundai_app/modules/route.dart';
import 'package:hyundai_app/modules/theme.dart';
import 'package:hyundai_app/screens/register/register_first_step.dart';
import 'package:hyundai_app/screens/register/register_second_step.dart';

class RegisterPageScreen extends StatefulWidget {
  const RegisterPageScreen({Key? key}) : super(key: key);

  @override
  State<RegisterPageScreen> createState() => _RegisterPageScreenState();
}

class _RegisterPageScreenState extends State<RegisterPageScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  late double currentStep;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );

    currentStep =
        tabController.length / tabController.length / tabController.length;

    tabController.animation!.addListener(
      () => setState(() => currentStep =
          (tabController.animation!.value + 1) / tabController.length),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      canRefresh: false,
      appBar: CustomAppBar(
        title: "Sign Up",
        overrideBackButton: () {
          if (tabController.index > 0) {
            setState(() => currentStep -= 1);
            tabController.animateTo(currentStep.round());
            return;
          }

          return Modular.to.pop();
        },
      ),
      child: Stack(
        children: [
          TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              RegisterFirstStepScreen(),
              RegisterSecondStepScreen(),
            ],
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  CustomProgress(
                    value: currentStep,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    color: Colors.white,
                    child: Center(
                      child: CustomButton(
                        label: tabController.index < tabController.length - 1
                            ? "Next"
                            : "Sign Up",
                        textColor: Colors.white,
                        buttonColor: Palette.primaryColor,
                        onPressed: onNextPressed,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  onNextPressed() {
    if (tabController.index < tabController.length - 1) {
      setState(() => currentStep += 1);
      tabController.animateTo(tabController.index + 1);
      return;
    }

    onSignUp();
  }

  onSignUp() {
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
            Modular.to.navigate(
              Screens.success,
              arguments: ResultPageType(
                title: "Registration Successfully",
                description: "Login now to continue using the application",
              ).toJson(),
            );
          });
        },
      ),
    );
  }
}
