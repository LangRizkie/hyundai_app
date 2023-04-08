import "package:camera/camera.dart";
import "package:dotted_border/dotted_border.dart";
import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:hyundai_app/components/customization/custom_app_bar.dart";
import "package:hyundai_app/components/customization/custom_bottomsheet.dart";
import "package:hyundai_app/components/customization/custom_button.dart";
import "package:hyundai_app/components/customization/custom_list_icon_button.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/components/input_calendar.dart";
import "package:hyundai_app/components/labeled_textformfield.dart";
import "package:hyundai_app/components/layout.dart";
import "package:hyundai_app/modules/theme.dart";

class MyCarUpdatePageScreen extends StatefulWidget {
  const MyCarUpdatePageScreen({super.key});

  @override
  State<MyCarUpdatePageScreen> createState() => _MyCarUpdatePageScreenState();
}

class _MyCarUpdatePageScreenState extends State<MyCarUpdatePageScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime maximumDate = DateTime.now().add(const Duration(days: 1825));

  @override
  Widget build(BuildContext context) {
    return Layout(
      canRefresh: false,
      appBar: CustomAppBar(
        title: "Update Data STNK/STCK",
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              children: [
                LabeledTextFormField(
                  label: "License Plate Number",
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Input license plate number",
                    ),
                  ),
                ),
                LabeledTextFormField(
                  label: "Car Registration Letter Name",
                  informationLabel: "STNK/SKCK Name",
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Input car registration letter name",
                    ),
                  ),
                ),
                LabeledTextFormField(
                  label: "Car Registration Letter Valid Date",
                  informationLabel: "STNK/SKCK Valid Date",
                  child: InputCalendar(
                    onPressed: onPressedDateOfBirth,
                    value: selectedDate,
                  ),
                ),
                LabeledTextFormField(
                  label: "Car Registration Letter Number",
                  informationLabel: "STNK/SKCK Number",
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Input car registration letter number",
                    ),
                  ),
                ),
                LabeledTextFormField(
                  label: "Car Registration Letter Photo",
                  informationLabel: "STNK/SKCK Number",
                  child: ScaleTap(
                    onPressed: onPressedSelectPhoto,
                    child: DottedBorder(
                      dashPattern: const [6, 6],
                      color: Palette.backgroundSecondaryColor,
                      strokeWidth: 1,
                      child: Container(
                        width: double.infinity,
                        height: 144,
                        color: Colors.white,
                        child: const Center(
                          child: Gap(
                            gap: 8,
                            direction: Axis.vertical,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                color: Colors.grey,
                              ),
                              Text(
                                "Select a Photo",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  label: "Save",
                  width: double.infinity,
                  textColor: Colors.white,
                  buttonColor: Palette.primaryColor,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onPressedDateOfBirth() {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: maximumDate,
    ).then((value) => setState(() => selectedDate = value!));
  }

  onPressedSelectPhoto() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomBottomSheet(
        title: "Upload Photo",
        children: [
          CustomListIconButton(
            prefixIcon: Icons.camera_alt_outlined,
            label: "Take Photo",
            onPressed: () {
              Modular.to.pop();
            },
          ),
          CustomListIconButton(
            prefixIcon: Icons.image_outlined,
            label: "Choose From Gallery",
            onPressed: () {
              Modular.to.pop();
            },
          ),
        ],
      ),
    );
  }
}
