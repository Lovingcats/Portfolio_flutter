import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class DeviceFramePainter extends CustomPainter {
  final ui.Image backgroundImage;
  final ui.Image homeButtonImage;
  final ui.Image backButtonImage;
  final ui.Image recentButtonImage;
  final ui.Image statusbarImage;
  final double buttonWidth;
  final double buttonHeight;
  final double buttonSpacing;

  DeviceFramePainter(this.backgroundImage, this.homeButtonImage, this.backButtonImage, this.recentButtonImage, this.statusbarImage, this.buttonWidth, this.buttonHeight, this.buttonSpacing);

 @override
  void paint(Canvas canvas, Size size) {
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

    const statusBarHeight = 30.0;

    final statusBarRect = Rect.fromLTWH(10, 10, size.width - 20, statusBarHeight);
    canvas.drawImageRect(
      statusbarImage,
      Rect.fromLTWH(0, 0, statusbarImage.width.toDouble(), statusbarImage.height.toDouble()),
      statusBarRect,
      Paint(),
    );

    // 카메라
    final cameraPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width / 2, 25),
      7.5,
      cameraPaint,
    );

    // 하단 네비게이션 바 영역
    const navBarHeight = 60.0;
    final navBarPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(0, size.height - navBarHeight, size.width, navBarHeight),
      navBarPaint,
    );

    // 홈 버튼
    canvas.drawImageRect(
      homeButtonImage,
      Rect.fromLTWH(0, 0, homeButtonImage.width.toDouble(), homeButtonImage.height.toDouble()),
      Rect.fromLTWH(size.width / 2 - buttonWidth / 2, size.height - navBarHeight / 2 - buttonHeight / 2 - 3, buttonWidth, buttonHeight),
      Paint(),
    );

    // 뒤로 가기 버튼
    canvas.drawImageRect(
      backButtonImage,
      Rect.fromLTWH(0, 0, backButtonImage.width.toDouble(), backButtonImage.height.toDouble()),
      Rect.fromLTWH(size.width / 2 - buttonSpacing - buttonWidth / 2, size.height - navBarHeight / 2 - buttonHeight / 2 - 3, buttonWidth, buttonHeight),
      Paint(),
    );

    // 최근 앱 버튼
    canvas.drawImageRect(
      recentButtonImage,
      Rect.fromLTWH(0, 0, recentButtonImage.width.toDouble(), recentButtonImage.height.toDouble()),
      Rect.fromLTWH(size.width / 2 + buttonSpacing - buttonWidth / 2, size.height - navBarHeight / 2 - buttonHeight / 2 - 3, buttonWidth, buttonHeight),
      Paint(),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}