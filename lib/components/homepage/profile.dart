import "package:flutter/material.dart";
import "package:hyundai_app/components/homepage/profile_data.dart";
import "package:hyundai_app/components/homepage/profile_status.dart";

class ProfileComponent extends StatefulWidget {
  const ProfileComponent({Key? key}) : super(key: key);

  @override
  State<ProfileComponent> createState() => _ProfileComponentState();
}

class _ProfileComponentState extends State<ProfileComponent> {
  final double height = 56;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ProfileData(
          height: height,
        ),
        ProfileStatus(
          height: height,
        )
      ],
    );
  }
}
