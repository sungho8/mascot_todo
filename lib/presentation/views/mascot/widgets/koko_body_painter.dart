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

    // 1. 색상 정의 (플랫 디자인을 위한 단색)
    const baseColor = Color(0xFFE0E7FF);
    // const detailColor = Color(0xFF1E293B); // 현재 사용 안함

    final paint = Paint()
      ..color = baseColor
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

    // 그림자 없이 단색 채우기만 수행
    canvas.drawRRect(bodyRRect, paint);

    // 4. 수염 (Whiskers)
    final whiskerPaint = Paint()
      ..color = const Color(0xFFCBD5E1)
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
    final path = Path();

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
    canvas.drawLine(Offset.zero, Offset(dx, dy), paint);
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
