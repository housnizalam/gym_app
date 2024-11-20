import 'package:flutter/material.dart';

class MyInkwell extends StatelessWidget {
  const MyInkwell({
    super.key,
    this.child,
    this.onTap,
    this.opacity = 1,
    this.decoration,
    this.height,
    this.width,
    this.borderRadius,
  });

  final Widget? child;
  final VoidCallback? onTap;
  final double opacity;
  final Decoration? decoration;
  final double? height;
  final double? width;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Opacity(
        opacity: 1,
        child: AnimatedContainer(
          height: height,
          width: width,
          duration: const Duration(milliseconds: 400),
          margin: const EdgeInsets.all(2.0),
          alignment: Alignment.center,
          decoration: decoration ??
              BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
                gradient: RadialGradient(
                  radius: 0.7,
                  colors: [
                    Colors.blue[900]!,
                    Colors.black,
                  ],
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
              ),
          child: child,
        ),
      ),
    );
  }
}
