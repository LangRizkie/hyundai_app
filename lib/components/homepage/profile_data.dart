import "package:flutter/material.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/modules/theme.dart";

class ProfileData extends StatefulWidget {
  const ProfileData({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.primaryColor,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                16,
                24,
                16,
                widget.height,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        picture(),
                        content(),
                      ],
                    ),
                  ),
                  ScaleTap(
                    child: const Gap(
                      gap: 2,
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_outline_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                        Text(
                          "Check-In",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(
              height: widget.height - 16,
              color: Palette.backgroundColor,
            )
          ],
        ),
      ),
    );
  }

  CircleAvatar picture() {
    return const CircleAvatar(
      backgroundColor: Palette.secondaryColor,
      child: Text("GR"),
    );
  }

  Widget content() {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hi! Good morning,",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 4,
              ),
              child: const Text(
                "Gilang Rizkie",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Text(
              "Member ID: 12345AB",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
