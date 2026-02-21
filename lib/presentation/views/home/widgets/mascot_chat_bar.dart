import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../di/ai/ai_providers.dart';
import '../../../../core/design_system/design_system.dart';

/// 홈 화면 미니 마스코트 + 채팅 입력 바
/// AI를 통해 입력된 내용이 TODO인지 고민 상담인지 판별하여 처리
class MascotChatBar extends ConsumerStatefulWidget {
  const MascotChatBar({
    required this.mascotName,
    required this.onTodoCreated,
    super.key,
  });

  final String mascotName;
  final void Function(String title, String? categoryId) onTodoCreated;

  @override
  ConsumerState<MascotChatBar> createState() => _MascotChatBarState();
}

class _MascotChatBarState extends ConsumerState<MascotChatBar>
    with SingleTickerProviderStateMixin {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  String? _mascotResponse;
  bool _showResponse = false;
  bool _isLoading = false;
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

  Future<void> _handleSubmit(String text) async {
    if (text.trim().isEmpty || _isLoading) return;

    setState(() => _isLoading = true);

    try {
      final useCase = ref.read(processChatUseCaseProvider);
      final result = await useCase(text.trim(), widget.mascotName);

      result.fold(
        (failure) {
          _showMascotBubble('미안해, 지금은 조금 정신이 없어… 나중에 다시 말해줄래?');
        },
        (analysis) {
          if (analysis.type == 'todo' && analysis.title != null) {
            // TODO로 추가
            widget.onTodoCreated(analysis.title!, analysis.categoryId);
          }
          // 결과 메시지 표시 (TODO 추가 확인 또는 일반 답변)
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
                  decoration: BoxDecoration(
                    color: _isLoading
                        ? AppColors.buttonDisabled
                        : AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: _isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.textOnDark,
                          ),
                        )
                      : const Icon(
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
