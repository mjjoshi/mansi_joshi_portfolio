import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientImageButton extends StatefulWidget {
  final String text;
  final bool isFromMobile;
  final VoidCallback onTap;

  const GradientImageButton({super.key, required this.text, required this.onTap, this.isFromMobile = false});

  @override
  State<GradientImageButton> createState() => _GradientImageButtonState();
}

class _GradientImageButtonState extends State<GradientImageButton> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 1.05); // SCALE UP on press
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0); // back to normal
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,

      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: widget.onTap,

        child: Container(
          padding: widget.isFromMobile ? const EdgeInsets.symmetric(horizontal: 5, vertical: 5) : const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.isFromMobile ? 10 : 12),
            //  gradient: const LinearGradient(colors: [Color(0xFF0000DC), Color(0xFF0055FF)]),
            gradient: const LinearGradient(colors: [Color(0xFF6347C6), Color(0xFFD946EF)]),
          ),
          child: Image.asset(widget.text, fit: BoxFit.contain, height: widget.isFromMobile ? 25.h : 30.h),
        ),
      ),
    );
  }
}
