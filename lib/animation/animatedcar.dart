import 'package:flutter/material.dart';

class animatedimage extends StatefulWidget {
  const animatedimage({Key? key}) : super(key: key);

  @override
  _animatedimageState createState() => _animatedimageState();
}

class _animatedimageState extends State<animatedimage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
  AnimationController(vsync: this, duration: const Duration(seconds: 2))
    ..status..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(
    begin: Offset(0,0),
    end: Offset(0, 0.08),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset("images/car11-modified.png"),
    );
  }
}

