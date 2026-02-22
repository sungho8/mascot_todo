import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../viewmodels/home/home_viewmodel.dart';
import '../../mascot/widgets/koko_body_painter.dart';
import '../../mascot/widgets/koko_tail.dart';

/// 홈 화면 마스코트 위젯
/// 평소: 부드럽게 떠다니는 float 애니메이션
/// Todo 완료 시: 기뻐하는 jump + 행복한 표정 애니메이션
class HomeMascotWidget extends ConsumerStatefulWidget {
  const HomeMascotWidget({super.key});

  @override
  ConsumerState<HomeMascotWidget> createState() => _HomeMascotWidgetState();
}

class _HomeMascotWidgetState extends ConsumerState<HomeMascotWidget>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _jumpController;
  late AnimationController _mouthController;
  late AnimationController _blinkController;

  bool _isCelebrating = false;
  int _lastTrigger = 0;

  @override
  void initState() {
    super.initState();

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    )..repeat(reverse: true);

    _jumpController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _mouthController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatController.dispose();
    _jumpController.dispose();
    _mouthController.dispose();
    _blinkController.dispose();
    super.dispose();
  }

  Future<void> _celebrate() async {
    if (_isCelebrating) return;
    setState(() => _isCelebrating = true);

    _mouthController.repeat(reverse: true);
    await _jumpController.forward(from: 0);
    await Future.delayed(const Duration(milliseconds: 100));
    await _jumpController.forward(from: 0);

    if (mounted) {
      _mouthController.stop();
      _mouthController.reset();
      setState(() => _isCelebrating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // celebrationTrigger 변화 감지
    ref.listen(homeViewModelProvider, (prev, next) {
      if (next.celebrationTrigger != _lastTrigger) {
        _lastTrigger = next.celebrationTrigger;
        _celebrate();
      }
    });

    return SizedBox(
      height: 160,
      child: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([_floatController, _jumpController]),
          builder: (context, child) {
            final floatVal =
                (math.sin(_floatController.value * 2 * math.pi) - 1) * 8;

            double jumpVal = 0;
            double scaleX = 1.0;
            double scaleY = 1.0;

            if (_jumpController.isAnimating || _jumpController.isCompleted) {
              final t = _jumpController.value;
              jumpVal = math.sin(t * math.pi) * -50;
              scaleX = 1.0 + math.sin(t * math.pi) * 0.12;
              scaleY = 1.0 - math.sin(t * math.pi) * 0.15;
            }

            return Transform.translate(
              offset: Offset(0, floatVal + jumpVal),
              child: Transform.scale(
                scaleX: scaleX,
                scaleY: scaleY,
                child: SizedBox(
                  width: 140,
                  height: 140,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Positioned(
                        right: -20,
                        bottom: 20,
                        child: KokoTail(),
                      ),

                      AnimatedBuilder(
                        animation: Listenable.merge([
                          _blinkController,
                          _mouthController,
                        ]),
                        builder: (context, _) {
                          return CustomPaint(
                            size: const Size(140, 140),
                            painter: KokoBodyPainter(
                              blinkValue: _blinkController.value,
                              mouthValue: _mouthController.value,
                              isSpeaking: _isCelebrating,
                              mousePos: Offset.zero,
                            ),
                          );
                        },
                      ),
                    ],
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
