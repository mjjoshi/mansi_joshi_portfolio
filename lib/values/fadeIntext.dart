import 'package:flutter/material.dart';

class FadeInText extends StatefulWidget {
  final Widget child;

  const FadeInText({super.key, required this.child});

  @override
  State<FadeInText> createState() => _SlideUpTextState();
}

class _SlideUpTextState extends State<FadeInText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _offset = Tween<Offset>( begin: const Offset(-0.4, 0),
      end: Offset.zero,).animate(CurvedAnimation(curve: Curves.easeOut, parent: _controller));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) => SlideTransition(position: _offset, child: widget.child);
}
