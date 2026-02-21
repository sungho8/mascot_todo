import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';

/// 홈 화면 미니 마스코트 + 채팅 입력 바
/// 입력된 내용이 TODO인지 고민 상담인지 판별하여 처리
class MascotChatBar extends StatefulWidget {
  const MascotChatBar({
    required this.mascotName,
    required this.onTodoCreated,
    super.key,
  });

  final String mascotName;
  final void Function(String title) onTodoCreated;

  @override
  State<MascotChatBar> createState() => _MascotChatBarState();
}

class _MascotChatBarState extends State<MascotChatBar>
    with SingleTickerProviderStateMixin {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  String? _mascotResponse;
  bool _showResponse = false;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

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

  /// 입력 내용이 TODO인지 판별
  bool _isTodoInput(String text) {
    final todoKeywords = [
      '해줘',
      '만들어',
      '추가',
      '할 일',
      '할일',
      '해야',
      '하기',
      '완료',
      '끝내기',
      '정리',
      '준비',
      '작성',
      '공부',
      '운동',
      '읽기',
      '청소',
      '요리',
      '쇼핑',
      '제출',
      '보내기',
      '확인',
      '예약',
      '연락',
    ];
    final lower = text.toLowerCase();
    return todoKeywords.any((keyword) => lower.contains(keyword));
  }

  /// 마스코트 고민 상담 응답 (Mock)
  String _getMascotResponse(String input) {
    final responses = [
      '${widget.mascotName}가 옆에 있을게, 걱정 마! 야옹~ 🐾',
      '음… 그건 좀 생각해볼 필요가 있겠다, 야옹! 🤔',
      '너라면 분명 잘 해낼 수 있어! 야옹~ 💪',
      '그런 날도 있는 거야. 오늘 하루도 수고했어, 야옹! 🌙',
      '하나씩 천천히 해보는 건 어때? ${widget.mascotName}가 응원할게! 🎯',
      '맞아맞아! 그 마음 완전 이해해, 야옹~ 😊',
      '잠깐 쉬어가도 괜찮아. 쉬는 것도 실력이야, 야옹! ☕',
    ];
    return responses[Random().nextInt(responses.length)];
  }

  void _handleSubmit(String text) {
    if (text.trim().isEmpty) return;

    if (_isTodoInput(text)) {
      // TODO로 추가
      widget.onTodoCreated(text.trim());
      _showMascotBubble('좋아! "${text.trim()}" 추가했어, 야옹! ✅');
    } else {
      // 고민 상담 응답
      _showMascotBubble(_getMascotResponse(text));
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

        // 채팅 입력 바
        Container(
          padding: AppSpacing.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: AppRadius.card,
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // 미니 마스코트 아이콘
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.pets,
                  size: 22,
                  color: AppColors.primary,
                ),
              ),

              AppSpacing.hSm,

              // 입력창
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  style: AppTypography.body1,
                  decoration: InputDecoration(
                    hintText: '${widget.mascotName}에게 말해보세요...',
                    hintStyle: AppTypography.body1.copyWith(
                      color: AppColors.textDisabled,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: AppSpacing.symmetric(
                      vertical: AppSpacing.xs,
                    ),
                  ),
                  textInputAction: TextInputAction.send,
                  onSubmitted: _handleSubmit,
                ),
              ),

              // 전송 버튼
              GestureDetector(
                onTap: () => _handleSubmit(_controller.text),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_upward,
                    size: 20,
                    color: AppColors.textOnDark,
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
