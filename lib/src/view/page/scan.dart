import 'package:fl_lib/fl_lib.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

final class BarcodeScannerPageArgs {
  final List<BarcodeFormat> formats;

  const BarcodeScannerPageArgs({
    this.formats = const [BarcodeFormat.qrCode],
  });
}

class BarcodeScannerPage extends StatefulWidget {
  final BarcodeScannerPageArgs args;

  const BarcodeScannerPage({
    super.key,
    this.args = const BarcodeScannerPageArgs(),
  });

  static const route = AppRoute<List<Barcode>, BarcodeScannerPageArgs>(
    page: BarcodeScannerPage.new,
    path: '/barcode_scan',
  );

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerWithOverlayState();
}

class _BarcodeScannerWithOverlayState extends State<BarcodeScannerPage> {
  late final MobileScannerController controller = MobileScannerController(
    formats: widget.args.formats,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width * 0.7;
    final scanWindow = Rect.fromCenter(
      center: size.center(Offset.zero),
      width: width,
      height: width,
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: MobileScanner(
              fit: BoxFit.cover,
              controller: controller,
              scanWindow: scanWindow,
              errorBuilder: (p0, p1, p2) {
                return Center(
                  child: Text('Error: $p0\n$p1\n$p2'),
                );
              },
              onDetect: (barcodes) async {
                final data = barcodes.barcodes
                    .takeWhile((e) => e.rawValue != null)
                    .toList();
                if (data.isEmpty) return;

                await controller.stop();
                await controller.dispose();
                context.pop(data);
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, value, child) {
              if (!value.isInitialized ||
                  !value.isRunning ||
                  value.error != null) {
                return const SizedBox();
              }

              return CustomPaint(
                painter: ScannerOverlay(scanWindow: scanWindow),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    try {
      controller.stop();
      controller.dispose();
    } catch (e) {
      debugPrint('Dispose barcode scanner controller: $e');
    }
    super.dispose();
  }
}

class ScannerOverlay extends CustomPainter {
  const ScannerOverlay({
    required this.scanWindow,
    this.borderRadius = 12.0,
  });

  final Rect scanWindow;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    // we need to pass the size to the custom paint widget
    final backgroundPath = Path()..addRect(Offset.zero & size);

    final cutoutPath = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          scanWindow,
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      );

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final borderRect = RRect.fromRectAndCorners(
      scanWindow,
      topLeft: Radius.circular(borderRadius),
      topRight: Radius.circular(borderRadius),
      bottomLeft: Radius.circular(borderRadius),
      bottomRight: Radius.circular(borderRadius),
    );

    // First, draw the background,
    // with a cutout area that is a bit larger than the scan window.
    // Finally, draw the scan window itself.
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
    canvas.drawRRect(borderRect, borderPaint);
  }

  @override
  bool shouldRepaint(ScannerOverlay oldDelegate) {
    return scanWindow != oldDelegate.scanWindow ||
        borderRadius != oldDelegate.borderRadius;
  }
}
