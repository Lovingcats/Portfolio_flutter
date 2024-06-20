import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'package:vector_math/vector_math_64.dart' as vmath;

class DeviceFramePainter extends CustomPainter {
  final ui.Image backgroundImage;
  final bool showBack;
  final double thickness;
  final vmath.Vector3 rotation;

  DeviceFramePainter(this.backgroundImage, {this.showBack = false, this.thickness = 20, required this.rotation});

  @override
  void paint(Canvas canvas, Size size) {
    if (rotation.y.abs() > 1.4 && rotation.y.abs() < 1.7) {
      _paintSide(canvas, size, rotation.y > 0 ? 'left' : 'right');
    } else if (rotation.x.abs() > 1.4 && rotation.x.abs() < 1.7) {
      _paintTopBottom(canvas, size, rotation.x > 0 ? 'top' : 'bottom');
    } else if (showBack) {
      _paintBack(canvas, size);
    } else {
      _paintFront(canvas, size);
    }
  }

  void _paintFront(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 183, 228, 252)
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

    final statusBarPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(10, 10, size.width - 20, 30),
      statusBarPaint,
    );

    final timePainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    // 시간
    timePainter.text = const TextSpan(
      text: "12:00",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
    timePainter.layout();
    timePainter.paint(canvas, const Offset(20, 15.8));

    final batteryPercentPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    // 배터리 퍼센트
    batteryPercentPainter.text = const TextSpan(
      text: "76%",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
    batteryPercentPainter.layout();
    // 위치를 화면 크기에 맞게 비례하여 설정
    batteryPercentPainter.paint(canvas, Offset(size.width - batteryPercentPainter.width - 38, 16.4));

    // 배터리
    canvas.save();
    canvas.translate(size.width - 25, 20);
    canvas.rotate(-3.14 / 2);

    final batteryPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final batteryLevelPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(-12, -10, 13, 8), // 가로형 배터리
        const Radius.circular(1.9),
      ),
      batteryPaint,
    );

    canvas.drawRect(
      const Rect.fromLTWH(-12, -10, 8, 8), // 가로형 배터리 내부
      batteryLevelPaint,
    );

    canvas.restore();

    // 네트워크 모양
    final signalPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 4; i++) {
      canvas.drawRect(
        Rect.fromLTWH(size.width - 96 + i * 6, 33.5 - i * 5, 4, i * 5),
        signalPaint,
      );
    }

    //카메라
    final cameraPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width / 2, 25),
      7.5,
      cameraPaint,
    );
  }

  void _paintBack(Canvas canvas, Size size) {
    final backPaint = Paint()
      ..color = Color.fromARGB(255, 183, 228, 252)
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(20),
      ),
      backPaint,
    );

    // S21+ 카메라 UI
    final cameraPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // 큰 카메라 렌즈
    canvas.drawCircle(
      Offset(size.width - 40, 80),
      10,
      cameraPaint,
    );

    // 중간 카메라 렌즈
    canvas.drawCircle(
      Offset(size.width - 40, 120),
      8,
      cameraPaint,
    );

    // 작은 카메라 렌즈
    canvas.drawCircle(
      Offset(size.width - 40, 150),
      6,
      cameraPaint,
    );

    // 플래시
    final flashPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width - 40, 180),
      4,
      flashPaint,
    );
  }

  void _paintSide(Canvas canvas, Size size, String side) {
    final sidePaint = Paint()
      ..color = const Color(0xff111724)
      ..style = PaintingStyle.fill;

    // 옆면 (왼쪽 또는 오른쪽)
    canvas.drawRect(
      Rect.fromLTWH(side == 'left' ? -thickness / 2 : size.width - thickness / 2, 0, thickness, size.height),
      sidePaint,
    );
  }

  void _paintTopBottom(Canvas canvas, Size size, String side) {
    final sidePaint = Paint()
      ..color = const Color(0xff111724)
      ..style = PaintingStyle.fill;

    // 위쪽 또는 아래쪽 면
    canvas.drawRect(
      Rect.fromLTWH(0, side == 'top' ? -thickness / 2 : size.height - thickness / 2, size.width, thickness),
      sidePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
