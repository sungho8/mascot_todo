import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/mascot_persona_ext.dart';
import '../../../../domain/entities/mascot/mascot_entity.dart';
import '../../../../domain/entities/mascot/mascot_emotion.dart';
import '../../../../di/ai/ai_providers.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../viewmodels/home/home_viewmodel.dart';
import '../../mascot/widgets/animated_mascot.dart';

/// 홈 화면 미니 마스코트 + 채팅 입력 바
/// [마스코트 캐릭터] - [채팅 입력창] - [보내기 버튼] 구조
/// Todo 완료 시 마스코트가 기뻐하는 애니메이션 반응
class MascotChatBar extends ConsumerStatefulWidget {
  const MascotChatBar({
    required this.mascot,
    required this.onTodoCreated,
    super.key,
  });

  final MascotEntity mascot;
  final void Function(String title, String? categoryId, bool isRecurring)
  onTodoCreated;

  @override
  ConsumerState<MascotChatBar> createState() => _MascotChatBarState();
}

class _MascotChatBarState extends ConsumerState<MascotChatBar>
    with TickerProviderStateMixin {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  String? _mascotResponse;
  bool _showResponse = false;
  bool _isLoading = false;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  // 마스코트 애니메이션 제어 키
  final _mascotKey = GlobalKey<AnimatedMascotState>();
  bool _isCelebrating = false;
  int _lastTrigger = 0;

  MascotEmotion _currentEmotion = MascotEmotion.neutral;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  Future<void> _celebrate() async {
    if (_isCelebrating) return;
    setState(() => _isCelebrating = true);

    await _mascotKey.currentState?.playDoubleJump();

    if (mounted) {
      setState(() => _isCelebrating = false);
    }
  }

  Future<void> _handleSubmit(String text) async {
    if (text.trim().isEmpty || _isLoading) return;

    setState(() => _isLoading = true);

    try {
      final useCase = ref.read(processChatUseCaseProvider);
      final result = await useCase(text.trim(), widget.mascot);

      result.fold(
        (failure) {
          _showMascotBubble('미안해, 지금은 조금 정신이 없어… 나중에 다시 말해줄래?');
        },
        (analysis) {
          if (analysis.type == 'todo' && analysis.title != null) {
            widget.onTodoCreated(
              analysis.title!,
              analysis.categoryId,
              analysis.isRecurring,
            );
            // Todo가 성공적으로 추가되면 항상 기쁜 표정
            setState(() {
              _currentEmotion = MascotEmotion.happy;
            });
          } else {
            // 그 외 대화는 AI가 판단한 감정 반영
            setState(() {
              _currentEmotion = MascotEmotion.fromString(analysis.emotion);
            });
          }
          _showMascotBubble(analysis.message);
        },
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }

    _controller.clear();
    _focusNode.unfocus();
  }

  void _showMascotBubble(String message) {
    setState(() {
      _mascotResponse = message;
      _showResponse = true;
    });
    _fadeController.forward(from: 0);

    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        _fadeController.reverse().then((_) {
          if (mounted) {
            setState(() => _showResponse = false);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Todo 완료 시 축하 애니메이션 트리거
    ref.listen(homeViewModelProvider, (prev, next) {
      if (next.celebrationTrigger != _lastTrigger) {
        _lastTrigger = next.celebrationTrigger;
        _celebrate();
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 마스코트 응답 말풍선
        if (_showResponse)
          FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              margin: AppSpacing.only(bottom: AppSpacing.xs),
              padding: AppSpacing.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: AppRadius.borderLg,
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.pets,
                    size: AppSpacing.iconSm,
                    color: AppColors.primary,
                  ),

                  AppSpacing.hXs,

                  Expanded(
                    child: Text(
                      _mascotResponse ?? '',
                      style: AppTypography.body2.copyWith(
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        // 마스코트 + 채팅 입력 바
        Container(
          padding: AppSpacing.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          color: Colors.white, // 하단 네비게이션과 동일한 배경색
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 애니메이션 마스코트 캐릭터
              AnimatedMascot(
                key: _mascotKey,
                size: 44.0,
                isSpeaking: _isCelebrating,
                emotion: _isCelebrating ? MascotEmotion.happy : _currentEmotion,
              ),

              AppSpacing.hMd,

              // 채팅 영역 (테두리 없는 연한 회색 배경의 알약 모양 통합 UI)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 8,
                    top: 8,
                    bottom: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F5F7), // 회색 배경
                    borderRadius: BorderRadius.circular(36), // 알약 모양
                  ),
                  child: Row(
                    children: [
                      // 입력창
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF334155),
                          ),
                          decoration: InputDecoration(
                            hintText: widget.mascot.chatHint,
                            hintStyle: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF94A3B8),
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: AppSpacing.symmetric(
                              vertical: AppSpacing.sm,
                              horizontal: AppSpacing.xs,
                            ),
                          ),
                          textInputAction: TextInputAction.send,
                          onSubmitted: _handleSubmit,
                        ),
                      ),

                      AppSpacing.hSm,

                      // 전송 버튼
                      GestureDetector(
                        onTap: () => _handleSubmit(_controller.text),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: _isLoading
                                ? const Color(0xFFCBD5E1)
                                : const Color(0xFF34D399), // 민트/그린 버튼 색상
                            shape: BoxShape.circle,
                          ),
                          child: _isLoading
                              ? const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Icon(
                                  Icons.send_rounded,
                                  color: Color(0xFF0F172A), // 진한 네이비 아이콘
                                  size: 22,
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
      ],
    );
  }
}
