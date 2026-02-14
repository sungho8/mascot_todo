import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../domain/entities/user/user_entity.dart';

/// 홈 화면 상단바
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final UserEntity? user;

  const HomeAppBar({
    super.key,
    this.user,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            child: user?.profileImagePath != null
                ? Image.asset(user!.profileImagePath!)
                : Icon(
                    Icons.person,
                    color: AppColors.primary,
                    size: 24,
                  ),
          ),

          AppSpacing.hMd,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  user?.name ?? '게스트',
                  style: AppTypography.h4,
                ),

                Text(
                  'Lv.${user?.level ?? 0}',
                  style: AppTypography.body2.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
