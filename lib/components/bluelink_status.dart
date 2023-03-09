import 'package:flutter/material.dart';
import 'package:hyundai_app/modules/theme.dart';

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
    super.initState();
    status = widget.isConnected ? 'Connected' : 'Unconnected';
    color =
        widget.isConnected ? Palette.secondaryColor : Colors.blueGrey.shade200;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Wrap(
        spacing: 4,
        children: [
          const Icon(
            Icons.share_outlined,
            size: 10,
            color: Colors.white,
          ),
          Text(
            status,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
