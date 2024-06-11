import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              painter: DeviceFramePainter(),
            );
          },
        ),
      ),
    );
  }
}

class DeviceFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final bluePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    // 디바이스 외곽
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(20),
      ),
      paint,
    );

    // 파란색 외곽 테두리
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(5, 5, size.width - 10, size.height - 10),
        Radius.circular(15),
      ),
      bluePaint,
    );

    // 전원 버튼
    final powerButtonPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width, size.height / 2 - 130, 4.5, 70),
        Radius.circular(5),
      ),
      powerButtonPaint,
    );

    // 볼륨 버튼
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width, size.height / 2 - 320, 4.5, 125),
        Radius.circular(5),
      ),
      powerButtonPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
