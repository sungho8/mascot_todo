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

    // 1. 색상 정의 (플랫 디자인 기반)
    final shadowPaint = Paint()
      ..color =
          const Color(0xFFD3DDF2) // 그림자 (우측 하단)
      ..style = PaintingStyle.fill;

    final mainPaint = Paint()
      ..color =
          const Color(0xFFE2E8F6) // 메인 밝은 베이스
      ..style = PaintingStyle.fill;

    // 2. 귀 (Ear) - 몸통 베이스(main) 뒤에 위치
    _drawEar(canvas, size, true);
    _drawEar(canvas, size, false);

    // 3. 그림자 영역 (전체 크기의 베이스)
    final shadowRRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, w, h),
      topLeft: Radius.circular(w * 0.5),
      topRight: Radius.circular(w * 0.5),
      bottomLeft: Radius.circular(w * 0.45),
      bottomRight: Radius.circular(w * 0.45),
    );
    canvas.drawRRect(shadowRRect, shadowPaint);

    // 4. 메인 역영 (좌상단으로 정렬, 우하단 그림자가 드러나게 축소)
    final mainRRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, w - 8, h - 8),
      topLeft: Radius.circular((w - 8) * 0.5),
      topRight: Radius.circular((w - 8) * 0.5),
      bottomLeft: Radius.circular((w - 8) * 0.45),
      bottomRight: Radius.circular((w - 8) * 0.45),
    );
    canvas.drawRRect(mainRRect, mainPaint);

    // 5. 수염 (Whiskers: 이미지처럼 직선형태로 살짝 뻗침)
    final whiskerPaint = Paint()
      ..color = const Color(0xFFB1C0D6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    // 왼쪽 수염
    _drawWhiskerLine(canvas, Offset(w * 0.12, h * 0.55), -22, -3, whiskerPaint);
    _drawWhiskerLine(canvas, Offset(w * 0.08, h * 0.63), -25, 1, whiskerPaint);

    // 오른쪽 수염
    _drawWhiskerLine(canvas, Offset(w * 0.88, h * 0.55), 22, -3, whiskerPaint);
    _drawWhiskerLine(canvas, Offset(w * 0.92, h * 0.63), 25, 1, whiskerPaint);

    // 6. 볼터치 (Blush) - 눈보다 뒤에 그려지도록 순서 유지
    double eyeY = h * 0.58;
    final blushPaint = Paint()
      ..color = const Color(0xFFFDB5C1).withValues(alpha: 0.9);

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w * 0.18, eyeY + 4),
        width: 32,
        height: 16,
      ),
      blushPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w * 0.82, eyeY + 4),
        width: 32,
        height: 16,
      ),
      blushPaint,
    );

    // 7. 눈 (Eyes) - 눈동자 간격을 넓힘
    _drawEye(canvas, Offset(w * 0.29, eyeY), mousePos);
    _drawEye(canvas, Offset(w * 0.71, eyeY), mousePos);

    // 8. 입 (Mouth)
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
    final paint = Paint()..color = const Color(0xFFE2E8F6); // 몸통 메인 색상과 맞춤
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

  void _drawWhiskerLine(
    Canvas canvas,
    Offset start,
    double dx,
    double dy,
    Paint paint,
  ) {
    canvas.save();
    canvas.translate(start.dx, start.dy);
    canvas.drawLine(Offset.zero, Offset(dx, dy), paint);
    canvas.restore();
  }

  void _drawEye(Canvas canvas, Offset center, Offset mousePos) {
    final eyePaint = Paint()..color = const Color(0xFF1E293B);

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.drawCircle(Offset.zero, 13, eyePaint);

    final pupilPaint = Paint()..color = Colors.white;

    // 눈동자 추적 로직 (최대 이동 반경 제한)
    // mousePos는 -1.0 ~ 1.0 범위의 값으로 가정 (입력단에서 정규화 필요)
    double pdx = math.max(-1.0, math.min(1.0, mousePos.dx)) * 6.0;
    double pdy = math.max(-1.0, math.min(1.0, mousePos.dy)) * 6.0;

    canvas.drawCircle(Offset(pdx, pdy), 5, pupilPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(KokoBodyPainter oldDelegate) => true;
}
