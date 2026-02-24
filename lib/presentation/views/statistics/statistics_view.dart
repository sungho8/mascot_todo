import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/design_system/app_spacing.dart';
import '../../../core/design_system/app_typography.dart';
import '../../../core/design_system/app_colors.dart';
import '../../../domain/entities/user/user_entity.dart';
import 'widgets/summary_cards.dart';
import 'widgets/heatmap_calendar.dart';
import 'widgets/mascot_growth_section.dart';

import 'statistics_prototype_view.dart';

/// 통계 화면
class StatisticsView extends ConsumerWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const StatisticsPrototypeView();
  }
}
