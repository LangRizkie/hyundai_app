import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hyundai_app/components/customization/custom_app_bar.dart';
import 'package:hyundai_app/components/customization/custom_bottomsheet.dart';
import 'package:hyundai_app/components/customization/custom_button.dart';
import 'package:hyundai_app/components/customization/custom_list_icon_button.dart';
import 'package:hyundai_app/components/customization/custom_progress.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/components/input_calendar.dart';
import 'package:hyundai_app/components/input_dropdown.dart';
import 'package:hyundai_app/components/labeled_textformfield.dart';
import 'package:hyundai_app/components/layout.dart';
import 'package:hyundai_app/modules/theme.dart';

class RegisterPageScreen extends StatefulWidget {
  const RegisterPageScreen({Key? key}) : super(key: key);

  @override
  State<RegisterPageScreen> createState() => _RegisterPageScreenState();
}

class _RegisterPageScreenState extends State<RegisterPageScreen>
    with TickerProviderStateMixin {
  TextEditingController password = TextEditingController();

  late TabController tabController;
  late double currentStep;

  String? salutation;
  DateTime selectedDate = DateTime.now();

  bool showPassword = false;
  bool showConfirmationPassword = false;
  DateTime maximumDate =
      DateTime.now().subtract(const Duration(days: 6205)); // 17 years old

  @override
  void initState() {
    super.initState();

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
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
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
            children: [
              first(),
              second(),
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
                        label: "Next",
                        textColor: Colors.white,
                        buttonColor: Palette.primaryColor,
                        onPressed: () {
                          if (currentStep < tabController.length) {
                            setState(() => currentStep += 1);
                          }

                          tabController.animateTo(currentStep.round() - 1);
                        },
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

  first() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          top: 16,
          right: 16,
          bottom: 80,
        ),
        child: Form(
          child: Column(
            children: [
              LabeledTextFormField(
                label: "Salutation",
                child: InputDropdown(
                  onPressed: onPressedSalutation,
                  placeholder: "Select Salutation",
                  value: salutation,
                ),
              ),
              LabeledTextFormField(
                label: "First Name",
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Input first name",
                  ),
                ),
              ),
              LabeledTextFormField(
                label: "Last Name",
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Input last name",
                  ),
                ),
              ),
              LabeledTextFormField(
                label: "Date of Birth",
                child: InputCalendar(
                  onPressed: onPressedDateOfBirth,
                  value: selectedDate,
                ),
              ),
              LabeledTextFormField(
                label: "Phone Number",
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      ScaleTap(
                        onPressed: () {},
                        scaleMinValue: 0.99,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          margin: const EdgeInsets.only(right: 14),
                          color: Colors.white,
                          child: const Gap(
                            gap: 4,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "+62",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 20,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone Number",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }

  second() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          top: 16,
          right: 16,
          bottom: 80,
        ),
        child: Form(
          child: Column(
            children: [
              LabeledTextFormField(
                label: "Province",
                child: InputDropdown(
                  onPressed: onPressedProvince,
                  placeholder: "Select Province",
                ),
              ),
              LabeledTextFormField(
                label: "City",
                child: InputDropdown(
                  onPressed: onPressedCity,
                  placeholder: "Select City",
                ),
              ),
              LabeledTextFormField(
                label: "District",
                child: InputDropdown(
                  onPressed: onPressedDistrict,
                  placeholder: "Select District",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPressedSalutation() {
    const salute = ["Mr", "Mrs"];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CustomBottomSheet(
          title: "Salutation",
          children: List.generate(
            salute.length,
            (index) => CustomListIconButton(
              label: salute[index],
              onPressed: () => setState(() => salutation = salute[index]),
              suffixIcon:
                  salutation == salute[index] ? Icons.check_circle : null,
              suffixIconColor:
                  salutation == salute[index] ? Palette.secondaryColor : null,
            ),
          ),
        );
      },
    );
  }

  onPressedDateOfBirth() {
    showDatePicker(
      context: context,
      initialDate: maximumDate,
      firstDate: DateTime(1900),
      lastDate: maximumDate,
    ).then((value) => setState(() => selectedDate = value!));
  }

  onPressedProvince() {}
  onPressedCity() {}
  onPressedDistrict() {}
}
