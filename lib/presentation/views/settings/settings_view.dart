import 'package:flutter/material.dart';
import '../../../core/design_system/design_system.dart';

/// 설정 화면
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: const Center(
        child: Text('설정 화면', style: AppTypography.h2),
      ),
    );
  }
}
