import "package:flutter/material.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/modules/theme.dart";

class BlueLinkStatus extends StatefulWidget {
  const BlueLinkStatus({
    Key? key,
    this.isConnected = false,
  }) : super(key: key);

  final bool isConnected;

  @override
  State<BlueLinkStatus> createState() => _BlueLinkStatusState();
}

class _BlueLinkStatusState extends State<BlueLinkStatus> {
  late String status;
  late Color color;

  @override
  void initState() {
    status = widget.isConnected ? "Connected" : "Unconnected";
    color =
        widget.isConnected ? Palette.secondaryColor : Colors.blueGrey.shade200;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Gap(
        gap: 4,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.share_outlined,
            size: 8,
            color: Colors.white,
          ),
          Text(
            status,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
