library background_bubbles;

import 'dart:math';
import 'package:flutter/material.dart';

class BubblesAnimation extends StatefulWidget {
  const BubblesAnimation(
      {super.key,
      this.particleCount,
      this.particleColor = Colors.red,
      this.particleRadius,
      this.backgroundColor,
      this.widget});

  /// The count of the particles.
  final int? particleCount;

  /// The color of the particles.
  final Color particleColor;

  /// The color of the background.
  final Color? backgroundColor;

  /// The radius of the particles.
  final double? particleRadius;

  /// create widget
  final Widget? widget;

  @override
  State<BubblesAnimation> createState() => _BubblesAnimationState();
}

class _BubblesAnimationState extends State<BubblesAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> particles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Update Particle position based on the x,y
  void _updateParticlePosition(DragUpdateDetails details) {
    setState(() {
      final Offset newPosition = details.localPosition;
      for (var particle in particles) {
        final dx = newPosition.dx - particle.x;
        final dy = newPosition.dy - particle.y;
        final distance = sqrt(dx * dx + dy * dy);
        if (distance < 50) {
          particle.x = newPosition.dx;
          particle.y = newPosition.dy;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /// the total count - set here
    particles = List.generate(widget.particleCount ?? 500,
        (_) => Particle(context, widget.particleRadius ?? 3.0));
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: widget.backgroundColor ?? Colors.black,
      child: Stack(children: [
        GestureDetector(
          onPanUpdate: _updateParticlePosition,
          child: CustomPaint(
            painter:
                FluidsPainter(particles, _controller, widget.particleColor),
            size: MediaQuery.of(context).size,
          ),
        ),
        widget.widget ?? Container()
      ]),
    );
  }
}

class FluidsPainter extends CustomPainter {
  final List<Particle> particles;
  final Animation<double> animation;
  final Color particleColor;

  FluidsPainter(this.particles, this.animation, this.particleColor)
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = particleColor;
    for (final particle in particles) {
      particle.update();
      canvas.drawCircle(
        Offset(particle.x, particle.y),
        particle.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(FluidsPainter oldDelegate) => true;
}

class Particle {
  final BuildContext context;
  final double particleRadius;
  static final Random random = Random();
  double x = 0.0, y = 0.0, dx = 0.0, dy = 0.0, radius = 0.0;

  Particle(this.context, this.particleRadius) {
    x = random.nextDouble() * MediaQuery.sizeOf(context).width;
    y = random.nextDouble() * MediaQuery.sizeOf(context).height;
    dx = random.nextDouble() * 3 - 1;
    dy = random.nextDouble() * 3 - 1;
    radius = random.nextDouble() * particleRadius + 1;
  }

  void update() {
    x += dx;
    y += dy;
    if (x < 0 || x > 500) dx *= -1;
    if (y < 0 || y > 500) dy *= -1;
  }
}
