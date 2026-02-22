import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/mascot_persona_ext.dart';
import '../../../../domain/entities/mascot/mascot_entity.dart';
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 애니메이션 마스코트 캐릭터
              AnimatedMascot(
                key: _mascotKey,
                size: 44.0,
                isSpeaking: _isCelebrating,
              ),

              AppSpacing.hMd,

              // 입력창
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  style: AppTypography.body1,
                  decoration: InputDecoration(
                    hintText: widget.mascot.chatHint,
                    hintStyle: AppTypography.body1.copyWith(
                      color: AppColors.textDisabled,
                    ),
                    border: InputBorder.none,
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
                  width: 40,
                  height: 40,
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
