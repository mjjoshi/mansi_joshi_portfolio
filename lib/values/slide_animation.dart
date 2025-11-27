import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  final Widget child;
  final Offset beginOffset;
  final Duration duration;

  const SlideAnimation({
    super.key,
    required this.child,
    this.beginOffset = const Offset(0, 0.7), // slide from bottom
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _offsetAnimation = Tween<Offset>(begin: widget.beginOffset, end: Offset.zero).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _offsetAnimation, child: widget.child);
  }
}
