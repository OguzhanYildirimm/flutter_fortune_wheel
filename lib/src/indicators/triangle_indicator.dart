part of 'indicators.dart';

class TriangleIndicator extends StatelessWidget {
  final Color? color; // İçteki üçgenin rengi
  final Color? backgroundColor; // Arka plandaki üçgenin rengi
  final double width;
  final double height;
  final double elevation;

  const TriangleIndicator({
    Key? key,
    this.color,
    this.backgroundColor,
    this.width = 36.0,
    this.height = 36.0,
    this.elevation = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Transform.rotate(
      angle: _math.pi,
      child: SizedBox(
        width: width,
        height: height,
        child: _Triangle(
          fillColor: color ?? theme.colorScheme.secondary,
          backgroundColor: backgroundColor ?? Colors.red,
          elevation: elevation,
        ),
      ),
    );
  }
}

