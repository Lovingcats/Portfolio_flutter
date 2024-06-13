import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutterportfolio/widget/deviceFramePainter.dart';
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

