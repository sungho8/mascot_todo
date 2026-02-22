import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../../domain/entities/mascot/mascot_emotion.dart';
import 'koko_body_painter.dart';
import 'koko_tail.dart';

/// 재생 가능한 마스코트 애니메이션 위젯 (공통 컴포넌트)
class AnimatedMascot extends StatefulWidget {
  const AnimatedMascot({
    super.key,
    this.size = 140.0,
    this.isSpeaking = false,
    this.mousePos = Offset.zero,
    this.hasTail = false,
    this.emotion = MascotEmotion.neutral,
    this.onTap,
  });

  /// 출력될 정사각형 위젯의 크기
  final double size;

  /// 말할 때 입이 움직이는 애니메이션 재생 여부
  final bool isSpeaking;

  /// 눈동자가 따라갈 마우스 위치 (MascotView용)
  final Offset mousePos;

  /// 마스코트 감정 표정 상태
  final MascotEmotion emotion;

  /// 등 뒤의 꼬리 표시 여부 (MascotView용)
  final bool hasTail;

  /// 탭 시 호출될 콜백 (기본값은 제자리 점프)
  final VoidCallback? onTap;

  @override
  State<AnimatedMascot> createState() => AnimatedMascotState();
}

class AnimatedMascotState extends State<AnimatedMascot>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _jumpController;
  late AnimationController _mouthController;
  late AnimationController _blinkController;

  @override
  void initState() {
    super.initState();

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    )..repeat(reverse: true);

    _jumpController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );

    _mouthController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat(reverse: true);

    if (widget.isSpeaking) {
      _mouthController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(AnimatedMascot oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSpeaking && !oldWidget.isSpeaking) {
      _mouthController.repeat(reverse: true);
    } else if (!widget.isSpeaking && oldWidget.isSpeaking) {
      _mouthController.stop();
      _mouthController.reset();
    }
  }

  @override
  void dispose() {
    _floatController.dispose();
    _jumpController.dispose();
    _mouthController.dispose();
    _blinkController.dispose();
    super.dispose();
  }

  /// 외부에서 1회 점프 애니메이션 호출
  Future<void> playJump() async {
    await _jumpController.forward(from: 0);
  }

  /// 외부에서 2회 연속 점프 (기뻐하기) 애니메이션 호출
  Future<void> playDoubleJump() async {
    await _jumpController.forward(from: 0);
    await Future.delayed(const Duration(milliseconds: 80));
    if (mounted) {
      await _jumpController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        } else {
          playJump();
        }
      },
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _floatController,
            _jumpController,
            _blinkController,
            _mouthController,
          ]),
          builder: (context, child) {
            // 크기에 비례하여 뜨는 범위 및 점프 높이 설정
            final floatOffset =
                math.sin(_floatController.value * 2 * math.pi) *
                (widget.size * 0.05);

            double jumpOffset = 0;
            double scaleX = 1.0;
            double scaleY = 1.0;

            if (_jumpController.isAnimating || _jumpController.isCompleted) {
              final t = _jumpController.value;
              jumpOffset = math.sin(t * math.pi) * (widget.size * -0.28);
              scaleX = 1.0 + math.sin(t * math.pi) * 0.12;
              scaleY = 1.0 - math.sin(t * math.pi) * 0.15;
            }

            return Transform.translate(
              offset: Offset(0, floatOffset + jumpOffset),
              child: Transform.scale(
                scaleX: scaleX,
                scaleY: scaleY,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SizedBox(
                    width: 140, // KokoBodyPainter의 기준 해상도
                    height: 140,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        if (widget.hasTail)
                          const Positioned(
                            right: -25,
                            bottom: 25,
                            child: KokoTail(),
                          ),
                        CustomPaint(
                          size: const Size(140, 140),
                          painter: KokoBodyPainter(
                            blinkValue: _blinkController.value,
                            mouthValue: _mouthController.value,
                            isSpeaking: widget.isSpeaking,
                            mousePos: widget.mousePos,
                            emotion: widget.emotion,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
