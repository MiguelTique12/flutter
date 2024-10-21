// image_spinner.dart
import 'package:flutter/material.dart';
import 'dart:async';

class ImageSpinner extends StatefulWidget {
  final String imagePath;
  final Duration duration;
  final Function onFinish;

  const ImageSpinner({
    Key? key,
    required this.imagePath,
    required this.duration,
    required this.onFinish,
  }) : super(key: key);

  @override
  _ImageSpinnerState createState() => _ImageSpinnerState();
}

class _ImageSpinnerState extends State<ImageSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.8, end: 1.8).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    Timer(widget.duration, () {
      widget.onFinish();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Image.asset(
          widget.imagePath,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
