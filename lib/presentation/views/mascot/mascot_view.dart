import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../viewmodels/home/home_viewmodel.dart';
import '../../../di/ai/ai_providers.dart';
import '../../../domain/entities/mascot/mascot_emotion.dart';
import '../../../core/design_system/design_system.dart';
import 'widgets/animated_mascot.dart';
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
  late AnimationController _dotController;
  final _mascotKey = GlobalKey<AnimatedMascotState>();

  late String _message;
  bool _isSpeaking = false;
  bool _isLoading = false;
  Offset _mousePos = Offset.zero;
  MascotEmotion _currentEmotion = MascotEmotion.neutral;

  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    final homeState = ref.read(homeViewModelProvider);
    final mascot =
        homeState.mascots.where((m) => m.id == widget.mascotId).firstOrNull ??
        homeState.mainMascot;
    final mascotName = mascot?.name ?? '코코';
    final userName = homeState.user?.name;

    _message = userName != null
        ? "안녕 $userName! 나는 $mascotName이야. 무엇을 도와줄까? 야옹~"
        : "안녕! 나는 $mascotName이야. 무엇을 도와줄까? 야옹~";

    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  Future<void> _handleChat(String text) async {
    if (text.trim().isEmpty || _isLoading) return;

    final mascot = ref
        .read(homeViewModelProvider)
        .mascots
        .firstWhere(
          (m) => m.id == widget.mascotId,
          orElse: () => ref.read(homeViewModelProvider).mainMascot!,
        );

    setState(() {
      _isLoading = true;
      _isSpeaking = true;
    });

    _mascotKey.currentState?.playJump();

    try {
      final useCase = ref.read(processChatUseCaseProvider);
      final result = await useCase(text.trim(), mascot);

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
            setState(() {
              _currentEmotion = MascotEmotion.happy;
            });
          } else {
            setState(() {
              _currentEmotion = MascotEmotion.fromString(analysis.emotion);
            });
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
      }
    }

    _textController.clear();
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    _dotController.dispose();
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
                    width: math.min(450, MediaQuery.of(context).size.width),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // 말풍선
                        Positioned(
                          top: 40,
                          left: 16,
                          right: 16,
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
                                  AnimatedBuilder(
                                    animation: _dotController,
                                    builder: (context, _) {
                                      final String displayText;
                                      if (_isLoading) {
                                        final step = (_dotController.value * 3)
                                            .floor()
                                            .clamp(0, 2);
                                        displayText = switch (step) {
                                          0 => '●',
                                          1 => '●  ●',
                                          _ => '●  ●  ●',
                                        };
                                      } else {
                                        displayText = _message;
                                      }
                                      return Text(
                                        displayText,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF334155),
                                        ),
                                      );
                                    },
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
                          child: AnimatedMascot(
                            key: _mascotKey,
                            size: 180.0,
                            isSpeaking: _isSpeaking,
                            mousePos: _mousePos,
                            hasTail: true,
                            emotion: _currentEmotion,
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

            // 하단 채팅 입력 영역 (단일 통합 UI)
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 20,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 8,
                  top: 8,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(36),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        focusNode: _focusNode,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF334155),
                        ),
                        decoration: const InputDecoration(
                          hintText: '메시지를 입력하세요...',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          hintStyle: TextStyle(color: Color(0xFF94A3B8)),
                        ),
                        onSubmitted: _handleChat,
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () => _handleChat(_textController.text),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: _isLoading
                              ? const Color(0xFFCBD5E1)
                              : AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 20,
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
