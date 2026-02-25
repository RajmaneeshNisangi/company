import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ScrollReveal extends StatefulWidget {
  const ScrollReveal({
    super.key,
    required this.child,
    this.slideOffsetY = 18,
    this.duration = const Duration(milliseconds: 480),
    this.delay = Duration.zero,
    this.curve = Curves.easeOutCubic,
  });

  final Widget child;
  final double slideOffsetY;
  final Duration duration;
  final Duration delay;
  final Curve curve;

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal> {
  final GlobalKey _key = GlobalKey();
  ScrollPosition? _position;
  bool _revealed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _attachScrollListener();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  @override
  void dispose() {
    _position?.removeListener(_checkVisibility);
    super.dispose();
  }

  void _attachScrollListener() {
    final newPosition = Scrollable.maybeOf(context)?.position;
    if (newPosition == _position) {
      return;
    }

    _position?.removeListener(_checkVisibility);
    _position = newPosition;
    _position?.addListener(_checkVisibility);
  }

  void _checkVisibility() {
    if (_revealed || !mounted) {
      return;
    }

    final currentContext = _key.currentContext;
    if (currentContext == null) {
      return;
    }

    final renderObject = currentContext.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.attached) {
      return;
    }

    final viewportHeight = MediaQuery.sizeOf(context).height;
    final top = renderObject.localToGlobal(Offset.zero).dy;
    final bottom = top + renderObject.size.height;
    final threshold = viewportHeight * 0.9;

    if (top <= threshold && bottom >= 0) {
      setState(() => _revealed = true);
      _position?.removeListener(_checkVisibility);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      child: widget.child,
    ).animate(target: _revealed ? 1 : 0).fadeIn(
          delay: widget.delay,
          duration: widget.duration,
          curve: widget.curve,
        ).slideY(
          delay: widget.delay,
          duration: widget.duration,
          curve: widget.curve,
          begin: widget.slideOffsetY / 100,
          end: 0,
        );
  }
}
