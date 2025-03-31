library background_bubbles;

import 'dart:math';
import 'package:flutter/foundation.dart'; // Import for compute()
import 'package:flutter/material.dart';
import 'dart:async';

/// A widget that displays an animated background of moving particles.
class BubblesAnimation extends StatefulWidget {
  const BubblesAnimation({
    super.key,
    this.particleCount,
    this.particleColor = Colors.red,
    this.particleRadius,
    this.backgroundColor,
    this.widget,
    this.particleSpeed = 0.5,
    this.shape = ParticleShape.circle,
  });

  /// Number of particles in the animation.
  final int? particleCount;

  /// Color of the particles.
  final Color particleColor;

  /// Background color of the animation container.
  final Color? backgroundColor;

  /// Radius of the particles.
  final double? particleRadius;

  /// Optional widget to be displayed over the animation.
  final Widget? widget;

  /// Speed of particle movement.
  final double particleSpeed;

  /// Shape of the particles (circle or square).
  final ParticleShape shape;

  @override
  State<BubblesAnimation> createState() => _BubblesAnimationState();
}

class _BubblesAnimationState extends State<BubblesAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> particles;
  late Size screenSize;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    )..repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = MediaQuery.of(context).size;
    particles = List.generate(
      widget.particleCount ?? 500,
      (_) => Particle(screenSize, widget.particleRadius ?? 3.0,
          widget.particleSpeed, widget.shape),
    );
    _startParticleUpdates();
  }

  /// Starts a timer to update particles with compute() for web support.
  void _startParticleUpdates() {
    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) async {
      if (mounted) {
        /// Use compute() for particle updates on all platforms
        particles = await compute(updateParticles, particles);
        setState(() {});
      }
    });
  }

  /// Stops the timer when disposing the widget.
  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: widget.backgroundColor ?? Colors.black,
      child: Stack(
        children: [
          CustomPaint(
            painter: FluidsPainter(
                particles, _controller, widget.particleColor, widget.shape),
            size: screenSize,
          ),
          widget.widget ?? Container(),
        ],
      ),
    );
  }
}

/// Enum representing the possible shapes of particles.
enum ParticleShape { circle, square }

/// Custom painter responsible for rendering particles on canvas.
class FluidsPainter extends CustomPainter {
  final List<Particle> particles;
  final Animation<double> animation;
  final Color particleColor;
  final ParticleShape shape;

  FluidsPainter(this.particles, this.animation, this.particleColor, this.shape)
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = particleColor;

    for (final particle in particles) {
      particle.update(size);
      if (shape == ParticleShape.circle) {
        canvas.drawCircle(
            Offset(particle.x, particle.y), particle.radius, paint);
      } else {
        canvas.drawRect(
          Rect.fromCenter(
            center: Offset(particle.x, particle.y),
            width: particle.radius * 2,
            height: particle.radius * 2,
          ),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(FluidsPainter oldDelegate) => true;
}

/// Represents a single particle in the animation.
class Particle {
  final Size screenSize;
  final double particleRadius;
  final double speed;
  final ParticleShape shape;
  static final Random random = Random();
  double x = 0.0, y = 0.0, dx = 0.0, dy = 0.0, radius = 0.0;

  Particle(this.screenSize, this.particleRadius, this.speed, this.shape) {
    x = random.nextDouble() * screenSize.width;
    y = random.nextDouble() * screenSize.height;
    dx = (random.nextDouble() * 2 - 1) * speed;
    dy = (random.nextDouble() * 2 - 1) * speed;
    radius = random.nextDouble() * particleRadius + 1;
  }

  /// Updates the position of the particle, reversing direction on boundary collision.
  void update(Size size) {
    x += dx;
    y += dy;
    if (x < 0 || x > size.width) dx *= -1;
    if (y < 0 || y > size.height) dy *= -1;
  }
}

/// Function for updating particles, used with compute().
List<Particle> updateParticles(List<Particle> particles) {
  for (var particle in particles) {
    particle
        .update(Size(particle.screenSize.width, particle.screenSize.height));
  }
  return particles;
}
