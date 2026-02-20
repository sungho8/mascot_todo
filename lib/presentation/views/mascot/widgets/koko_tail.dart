import 'package:flutter/material.dart';

class KokoTail extends StatefulWidget {
  const KokoTail({super.key});

  @override
  State<KokoTail> createState() => _KokoTailState();
}

class _KokoTailState extends State<KokoTail>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: 0.26 + (_controller.value * 0.6), // 15 to 50 degrees approx
          origin: const Offset(-35, 0),
          child: Container(
            width: 70,
            height: 22,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E7FF),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }
}
