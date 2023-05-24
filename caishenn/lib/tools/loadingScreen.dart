import 'package:flutter/material.dart';

class loading_screen extends StatefulWidget {
  final double height;
  final double width;
   loading_screen({
    super.key,
    required this.height,
    required this.width
  });

  @override
  State<loading_screen> createState() => _loading_screenState();
}

class _loading_screenState extends State<loading_screen> with TickerProviderStateMixin {
  late  final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
)..repeat(reverse: false);

// Create an animation with value of type "double"
late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
);

 

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: widget.height,
      width: widget.width,
      child: RotationTransition(
       turns: _animation,
       child:Center(child: Container(
          height: widget.height*0.2,
          child: Image.asset('assets/images/logo_mobile.png')
    ))
      ),
    );
  }
}