import 'package:flutter/material.dart';

class BlinkingWidget extends StatefulWidget {
  final Widget widget;
  const BlinkingWidget(this.widget, {Key? key}) : super(key: key);
  @override
  _BlinkingWidgetState createState() => _BlinkingWidgetState();
}

class _BlinkingWidgetState extends State<BlinkingWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController!.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController!,
      child: widget.widget,
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}