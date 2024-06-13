import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choyongje portfolio website!',
      debugShowCheckedModeBanner: false,
      home: ScreenTypeLayout.builder(
        breakpoints: const ScreenBreakpoints(desktop: 1024, tablet: 768, watch: 250),
        mobile: (_) => OrientationLayoutBuilder(
          portrait: (context) => const MobilePortraitScreen(),
          landscape: (context) => const MobileLandscapeScreen(),
        ),
        tablet: (_) => const TabletScreen(),
        desktop: (_) => const DesktopScreen(),
      ),
    );
  }
}

class MobilePortraitScreen extends StatelessWidget {
  const MobilePortraitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MobileLandscapeScreen extends StatelessWidget {
  const MobileLandscapeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TabletScreen extends StatelessWidget {
  const TabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  _DesktopScreenState createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  ui.Image? _backgroundImage;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final ByteData data = await rootBundle.load('assets/img/deviceBackground.png');
    final List<int> bytes = data.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(Uint8List.fromList(bytes));
    final ui.FrameInfo fi = await codec.getNextFrame();
    setState(() {
      _backgroundImage = fi.image;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_backgroundImage == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: null,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final aspectRatio = 400 / 850;
            double deviceWidth;
            double deviceHeight;

            if (constraints.maxWidth / constraints.maxHeight > aspectRatio) {
              deviceHeight = constraints.maxHeight * 0.9;
              deviceWidth = deviceHeight * aspectRatio;
            } else {
              deviceWidth = constraints.maxWidth * 0.9;
              deviceHeight = deviceWidth / aspectRatio;
            }

            return CustomPaint(
              size: Size(deviceWidth, deviceHeight),
              painter: DeviceFramePainter(_backgroundImage!),
            );
          },
        ),
      ),
    );
  }
}

class DeviceFramePainter extends CustomPainter {
  final ui.Image backgroundImage;

  DeviceFramePainter(this.backgroundImage);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff68b8e3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final bluePaint = Paint()
      ..color = const Color(0xff111724)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20; 

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(20),
      ),
      paint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(10, 10, size.width - 20, size.height - 20), 
        const Radius.circular(15),
      ),
      bluePaint,
    );

    final imageRect = Rect.fromLTWH(10, 10, size.width - 20, size.height - 20);
    final clipRect = RRect.fromRectAndRadius(imageRect, const Radius.circular(15));
    canvas.save();
    canvas.clipRRect(clipRect);
    canvas.drawImageRect(
      backgroundImage,
      Rect.fromLTWH(0, 0, backgroundImage.width.toDouble(), backgroundImage.height.toDouble()),
      imageRect,
      paint,
    );
    canvas.restore();

    final powerButtonPaint = Paint()
      ..color = const Color(0xff111724)
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width + 3, size.height / 2 - 130, 4.5, 70),
        const Radius.circular(5),
      ),
      powerButtonPaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width + 3, size.height / 2 - 300, 4.5, 125),
        const Radius.circular(5),
      ),
      powerButtonPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
