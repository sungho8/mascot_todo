import 'dart:math' as math;
import 'package:flutter/material.dart';

class KokoBodyPainter extends CustomPainter {
  final double blinkValue;
  final double mouthValue;
  final bool isSpeaking;
  final Offset mousePos;

  KokoBodyPainter({
    required this.blinkValue,
    required this.mouthValue,
    required this.isSpeaking,
    required this.mousePos,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // 1. 색상 정의 및 입체감을 위한 그라디언트 적용
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFE0E7FF), // 기본 색상
          Color(0xFFC7D2FE), // 우측 아래 약간 진한 색상 (입체감)
        ],
      ).createShader(Rect.fromLTWH(0, 0, w, h))
      ..style = PaintingStyle.fill;

    // 2. 귀 (Ear) - 몸통 뒤에 위치
    _drawEar(canvas, size, true);
    _drawEar(canvas, size, false);

    // 3. 몸통 (Body: 50% 50% 45% 45%) - 플랫 속성 적용
    final bodyRRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, w, h),
      topLeft: Radius.circular(w * 0.5),
      topRight: Radius.circular(w * 0.5),
      bottomLeft: Radius.circular(w * 0.45),
      bottomRight: Radius.circular(w * 0.45),
    );

    // 입체감 있는 몸통 채우기
    canvas.drawRRect(bodyRRect, paint);

    // 4. 수염 (Whiskers)
    final whiskerPaint = Paint()
      ..color = const Color(0xFFCBD5E1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    _drawWhisker(
      canvas,
      Offset(w * 0.1, h * 0.55),
      -35,
      -5,
      12,
      whiskerPaint,
    ); // L1
    _drawWhisker(
      canvas,
      Offset(w * 0.1, h * 0.65),
      -35,
      0,
      0,
      whiskerPaint,
    ); // L2
    _drawWhisker(
      canvas,
      Offset(w * 0.9, h * 0.55),
      35,
      -5,
      -12,
      whiskerPaint,
    ); // R1
    _drawWhisker(
      canvas,
      Offset(w * 0.9, h * 0.65),
      35,
      0,
      0,
      whiskerPaint,
    ); // R2

    // 5. 눈 (Eyes)
    double eyeY = h * 0.6;
    _drawEye(canvas, Offset(w * 0.32, eyeY), mousePos);
    _drawEye(canvas, Offset(w * 0.68, eyeY), mousePos);

    // 6. 볼터치 (Blush)
    final blushPaint = Paint()
      ..color = const Color(0xFFFDA4AF).withValues(alpha: 0.5);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w * 0.22, eyeY + 2),
        width: 28,
        height: 14,
      ),
      blushPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w * 0.78, eyeY + 2),
        width: 28,
        height: 14,
      ),
      blushPaint,
    );

    // 7. 입 (Mouth)
    final mouthPaint = Paint()
      ..color = const Color(0xFF1E293B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    if (isSpeaking) {
      final double mH = 8 + (mouthValue * 8);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(w * 0.5, h * 0.75),
            width: 22,
            height: mH,
          ),
          const Radius.circular(11),
        ),
        Paint()..color = const Color(0xFFF43F5E),
      );
    } else {
      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(w * 0.5, h * 0.7),
          width: 22,
          height: 11,
        ),
        0.2,
        math.pi - 0.4,
        false,
        mouthPaint,
      );
    }
  }

  void _drawEar(Canvas canvas, Size size, bool isLeft) {
    final w = size.width;
    final h = size.height;
    final paint = Paint()..color = const Color(0xFFE0E7FF);
    final innerPaint = Paint()..color = const Color(0xFFFBCFE8); // 핑크빛 귓구멍

    final path = Path();
    final innerPath = Path();

    if (isLeft) {
      canvas.save();
      canvas.translate(w * 0.2, h * 0.1);
      canvas.rotate(-18 * math.pi / 180);
      path.addRRect(
        RRect.fromRectAndCorners(
          const Rect.fromLTWH(-32.5, -32.5, 65, 65),
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(60),
        ),
      );
      canvas.drawPath(path, paint);

      // 귓구멍 추가
      innerPath.addRRect(
        RRect.fromRectAndCorners(
          const Rect.fromLTWH(-18, -12, 38, 38),
          topLeft: const Radius.circular(8),
          topRight: const Radius.circular(35),
        ),
      );
      canvas.drawPath(innerPath, innerPaint);

      canvas.restore();
    } else {
      canvas.save();
      canvas.translate(w * 0.8, h * 0.1);
      canvas.rotate(18 * math.pi / 180);
      path.addRRect(
        RRect.fromRectAndCorners(
          const Rect.fromLTWH(-32.5, -32.5, 65, 65),
          topRight: const Radius.circular(12),
          topLeft: const Radius.circular(60),
        ),
      );
      canvas.drawPath(path, paint);

      // 귓구멍 추가
      innerPath.addRRect(
        RRect.fromRectAndCorners(
          const Rect.fromLTWH(-20, -12, 38, 38),
          topRight: const Radius.circular(8),
          topLeft: const Radius.circular(35),
        ),
      );
      canvas.drawPath(innerPath, innerPaint);

      canvas.restore();
    }
  }

  void _drawWhisker(
    Canvas canvas,
    Offset start,
    double dx,
    double dy,
    double angleDeg,
    Paint paint,
  ) {
    canvas.save();
    canvas.translate(start.dx, start.dy);
    canvas.rotate(angleDeg * math.pi / 180);

    final path = Path();
    path.moveTo(0, 0);
    // 곡선 모양의 수염으로 변경
    path.quadraticBezierTo(dx * 0.5, dy + 8, dx, dy);

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  void _drawEye(Canvas canvas, Offset center, Offset mousePos) {
    final eyePaint = Paint()..color = const Color(0xFF1E293B);

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.drawCircle(Offset.zero, 13, eyePaint);

    final pupilPaint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(mousePos.dx * 4, mousePos.dy * 4), 5, pupilPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(KokoBodyPainter oldDelegate) => true;
}
