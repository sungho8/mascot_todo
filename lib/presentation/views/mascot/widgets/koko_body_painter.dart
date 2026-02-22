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
          Color(0xFFEFF6FF), // 더 밝은 기본 색상 (Blue 50)
          Color(0xFFDBEAFE), // 덜 짙은 우측 아래 색상 (Blue 100)
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

    final whiskerPaint = Paint()
      ..color = const Color(0xFFCBD5E1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    // 왼쪽 수염 (아래로 휘어지도록 각도 조절)
    _drawWhisker(
      canvas,
      Offset(w * 0.1, h * 0.55),
      -35,
      10, // 끝점 y를 아래로 (처지게)
      15, // 제어점 y 간격
      whiskerPaint,
    );
    _drawWhisker(canvas, Offset(w * 0.1, h * 0.65), -35, 10, 15, whiskerPaint);

    // 오른쪽 수염
    _drawWhisker(canvas, Offset(w * 0.9, h * 0.55), 35, 10, 15, whiskerPaint);
    _drawWhisker(canvas, Offset(w * 0.9, h * 0.65), 35, 10, 15, whiskerPaint);

    // 5. 볼터치 (Blush) - 눈보다 뒤에 그려지도록 순서 변경
    double eyeY = h * 0.6;
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

    // 6. 눈 (Eyes)
    _drawEye(canvas, Offset(w * 0.32, eyeY), mousePos);
    _drawEye(canvas, Offset(w * 0.68, eyeY), mousePos);

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
    final paint = Paint()..color = const Color(0xFFEFF6FF); // 몸통 기본색상과 맞춤
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
    double controlDy,
    Paint paint,
  ) {
    canvas.save();
    canvas.translate(start.dx, start.dy);

    final path = Path();
    path.moveTo(0, 0);
    // dx/2 지점에서 제어점을 controlDy 만큼 아래로 내려 곡선 형성
    path.quadraticBezierTo(dx * 0.5, controlDy, dx, dy);

    canvas.drawPath(path, paint);
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
