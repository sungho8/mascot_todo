import 'package:flutter/material.dart';
import '../../../core/design_system/design_system.dart';

/// 마스코트 화면
class MascotView extends StatelessWidget {
  const MascotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마스코트'),
      ),
      body: const Center(
        child: Text('마스코트 화면', style: AppTypography.h2),
      ),
    );
  }
}
