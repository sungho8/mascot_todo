import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'widgets/koko_body_painter.dart';
import 'widgets/koko_tail.dart';
import 'widgets/bubble_tail_painter.dart';

/// 마스코트 화면
class MascotView extends StatefulWidget {
  const MascotView({super.key});

  @override
  State<MascotView> createState() => _MascotViewState();
}

class _MascotViewState extends State<MascotView> with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _jumpController;
  late AnimationController _mouthController;
  late AnimationController _blinkController;

  String _message = "안녕! 나는 코코야. 무엇을 도와줄까? 야옹~";
  bool _isSpeaking = false;
  Offset _mousePos = Offset.zero;

  @override
  void initState() {
    super.initState();

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    )..repeat(reverse: true);

    _jumpController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _mouthController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );
  }

  void _handleAction(String type) {
    setState(() {
      _isSpeaking = true;
      if (type == 'todo') {
        _message = "오늘 할 일을 멋지게 분석해줄게! 야옹~";
      } else if (type == 'worry') {
        _message = "무슨 고민이든 다 말해봐, 들어줄게! 야옹~";
      } else {
        _message = "오늘 하루도 힘내! 너는 최고야! 야옹~";
      }
    });

    _jumpController.forward(from: 0);
    _mouthController.repeat(reverse: true);

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isSpeaking = false);
        _mouthController.stop();
        _mouthController.reset();
      }
    });
  }

  @override
  void dispose() {
    _floatController.dispose();
    _jumpController.dispose();
    _mouthController.dispose();
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: MouseRegion(
        onHover: (event) {
          setState(() {
            final size = MediaQuery.of(context).size;
            _mousePos = Offset(
              (event.localPosition.dx / size.width - 0.5) * 2,
              (event.localPosition.dy / size.height - 0.5) * 2,
            );
          });
        },
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 상단 메인 캐릭터 영역
                  SizedBox(
                    height: 380,
                    width: 450,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // 말풍선
                        Positioned(
                          top: 40,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: 1.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 18,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: const Color(0xFFF1F5F9),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.08),
                                    blurRadius: 30,
                                    offset: const Offset(0, 15),
                                  ),
                                ],
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Text(
                                    _message,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF334155),
                                    ),
                                  ),

                                  Positioned(
                                    bottom: -28,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: CustomPaint(
                                        size: const Size(24, 12),
                                        painter: BubbleTailPainter(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // 코코 캐릭터
                        Positioned(
                          bottom: 40,
                          child: AnimatedBuilder(
                            animation: Listenable.merge([
                              _floatController,
                              _jumpController,
                            ]),
                            builder: (context, child) {
                              double floatVal =
                                  (math.sin(
                                        _floatController.value * 2 * math.pi,
                                      ) -
                                      1) *
                                  10;
                              double jumpVal = 0;
                              double scaleX = 1.0;
                              double scaleY = 1.0;

                              if (_jumpController.isAnimating ||
                                  _jumpController.isCompleted) {
                                double t = _jumpController.value;
                                jumpVal = math.sin(t * math.pi) * -60;
                                scaleX = 1.0 + math.sin(t * math.pi) * 0.15;
                                scaleY = 1.0 - math.sin(t * math.pi) * 0.2;
                              }

                              return Transform.translate(
                                offset: Offset(0, floatVal + jumpVal),
                                child: Transform.scale(
                                  scaleX: scaleX,
                                  scaleY: scaleY,
                                  child: GestureDetector(
                                    onTap: () => _handleAction('meow'),
                                    child: SizedBox(
                                      width: 180,
                                      height: 180,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          const Positioned(
                                            right: -25,
                                            bottom: 25,
                                            child: KokoTail(),
                                          ),

                                          CustomPaint(
                                            size: const Size(180, 180),
                                            painter: KokoBodyPainter(
                                              blinkValue:
                                                  _blinkController.value,
                                              mouthValue:
                                                  _mouthController.value,
                                              isSpeaking: _isSpeaking,
                                              mousePos: _mousePos,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
