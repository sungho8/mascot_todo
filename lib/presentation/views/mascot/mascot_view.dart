import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../viewmodels/home/home_viewmodel.dart';
import '../../../di/ai/ai_providers.dart';
import '../../../core/design_system/design_system.dart';
import 'widgets/koko_body_painter.dart';
import 'widgets/koko_tail.dart';
import 'widgets/bubble_tail_painter.dart';

/// 마스코트 대화 화면
class MascotView extends ConsumerStatefulWidget {
  const MascotView({required this.mascotId, super.key});

  final String mascotId;

  @override
  ConsumerState<MascotView> createState() => _MascotViewState();
}

class _MascotViewState extends ConsumerState<MascotView>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _jumpController;
  late AnimationController _mouthController;
  late AnimationController _blinkController;

  late String _message;
  bool _isSpeaking = false;
  bool _isLoading = false;
  Offset _mousePos = Offset.zero;

  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _message = "안녕! 나는 ${widget.mascotId}야. 무엇을 도와줄까? 야옹~";

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

  Future<void> _handleChat(String text) async {
    if (text.trim().isEmpty || _isLoading) return;

    setState(() {
      _isLoading = true;
      _isSpeaking = true;
    });

    _jumpController.forward(from: 0);
    _mouthController.repeat(reverse: true);

    try {
      final useCase = ref.read(processChatUseCaseProvider);
      final result = await useCase(text.trim(), widget.mascotId);

      result.fold(
        (failure) {
          setState(() {
            _message = "미안해, 지금은 조금 정신이 없어… 나중에 다시 말해줄래?";
          });
        },
        (analysis) async {
          if (analysis.type == 'todo' && analysis.title != null) {
            // TODO 추가
            await ref
                .read(homeViewModelProvider.notifier)
                .createTodo(
                  title: analysis.title!,
                  categoryId: analysis.categoryId,
                );
          }

          setState(() {
            _message = analysis.message;
          });
        },
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _isSpeaking = false;
        });
        _mouthController.stop();
        _mouthController.reset();
      }
    }

    _textController.clear();
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
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
                                    onTap: () =>
                                        _jumpController.forward(from: 0),
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

            // 상단 뒤로가기 버튼
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              left: 20,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_ios_new),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  shadowColor: Colors.black12,
                  elevation: 5,
                ),
              ),
            ),

            // 하단 채팅 입력 영역
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 15,
                  bottom: MediaQuery.of(context).padding.bottom + 15,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: TextField(
                          controller: _textController,
                          focusNode: _focusNode,
                          style: const TextStyle(fontSize: 15),
                          decoration: const InputDecoration(
                            hintText: '메시지를 입력하세요...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Color(0xFF94A3B8)),
                          ),
                          onSubmitted: _handleChat,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () => _handleChat(_textController.text),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: _isLoading ? Colors.grey : AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: _isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(
                                Icons.send_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
