import 'package:flutter/material.dart';
import 'package:hyundai_app/components/input_dropdown.dart';
import 'package:hyundai_app/components/labeled_textformfield.dart';
import 'package:hyundai_app/modules/theme.dart';

class RegisterSecondStepScreen extends StatefulWidget {
  const RegisterSecondStepScreen({Key? key}) : super(key: key);

  @override
  State<RegisterSecondStepScreen> createState() =>
      _RegisterSecondStepScreenState();
}

class _RegisterSecondStepScreenState extends State<RegisterSecondStepScreen> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          16,
          16,
          16,
          80,
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
              LabeledTextFormField(
                label: "Referral Code (Optional)",
                child: TextFormField(
                  keyboardType: TextInputType.none,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Referral Code",
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor:
                          MaterialStateProperty.all(Palette.secondaryColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "I agree to the ",
                          style: TextStyle(
                            fontFamily: Constant.fontFamilyText,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Terms & Condition',
                              style: TextStyle(color: Palette.secondaryColor),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(color: Palette.secondaryColor),
                            ),
                            TextSpan(text: ' MyHyundai Indonesia'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPressedProvince() {}
  onPressedCity() {}
  onPressedDistrict() {}
}
