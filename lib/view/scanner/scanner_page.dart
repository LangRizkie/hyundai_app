import 'package:flutter/material.dart';
import 'package:hyundai_app/modules/theme.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:hyundai_app/components/customization/custom_app_bar.dart';
import 'package:hyundai_app/components/layout.dart';

class ScannerPageScreen extends StatefulWidget {
  const ScannerPageScreen({super.key});

  @override
  State<ScannerPageScreen> createState() => _ScannerPageScreenState();
}

class _ScannerPageScreenState extends State<ScannerPageScreen> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Layout(
      extendBodyBehindAppBar: true,
      canRefresh: false,
      appBar: CustomAppBar(
        isTransparent: true,
        leadingColor: Colors.white,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (BarcodeCapture barcode) {},
          ),
          ClipPath(
            clipper: CenterHolePath(
              dimension: MediaQuery.of(context).size.width * .6,
            ),
            child: Container(
              alignment: Alignment.center,
              color: Colors.black54,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .8,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.width * 0.2,
            ),
            child: const Text(
              "Kode QR akan terdeteksi secara otomatis setelah Anda menempatkan kode tersebut dalam garis panduan",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: Constant.fontFamilyText,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CenterHolePath extends CustomClipper<Path> {
  CenterHolePath({
    required this.dimension,
  });

  final double dimension;

  @override
  Path getClip(Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);

    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(
        Rect.fromCenter(
          center: Offset(
            size.width / 2,
            size.height / 2,
          ),
          width: dimension,
          height: dimension,
        ),
      )
      ..addRect(rect);

    return path;
  }

  @override
  bool shouldReclip(covariant CenterHolePath oldClipper) {
    return dimension != oldClipper.dimension;
  }
}
