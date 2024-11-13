part of 'indicators.dart';

class _TrianglePainter extends CustomPainter {
  final Color fillColor;
  final Color backgroundColor;
  final double strokeWidth;
  final double elevation;

  const _TrianglePainter({
    required this.fillColor,
    required this.backgroundColor,
    this.strokeWidth = 1,
    this.elevation = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final backgroundPaint = Paint()..color = backgroundColor;
    final fillPaint = Paint()..color = fillColor;
    final strokePaint = Paint()
      ..color = fillColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Çizimi arka plan (kırmızı) ile başlatıyoruz
    canvas.drawShadow(path, Colors.black, elevation, true);
    canvas.drawPath(path, backgroundPaint);

    // İçteki sarı üçgen için boyutları küçültüyoruz
    final innerPath = Path()
      ..moveTo(size.width / 2, size.height * 0.1)
      ..lineTo(size.width * 0.85, size.height * 0.9)
      ..lineTo(size.width * 0.15, size.height * 0.9)
      ..close();

    canvas.drawPath(innerPath, fillPaint);
    canvas.drawPath(innerPath, strokePaint);
  }

  @override
  bool shouldRepaint(_TrianglePainter oldDelegate) {
    return fillColor != oldDelegate.fillColor ||
        backgroundColor != oldDelegate.backgroundColor ||
        elevation != oldDelegate.elevation ||
        strokeWidth != oldDelegate.strokeWidth;
  }
}

class _Triangle extends StatelessWidget {
  final Color fillColor;
  final Color backgroundColor;
  final double elevation;

  const _Triangle({
    required this.fillColor,
    required this.backgroundColor,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(40, 40),
      painter: _TrianglePainter(
        fillColor: fillColor,
        backgroundColor: backgroundColor,
        strokeWidth: 1,
        elevation: elevation,
      ),
    );
  }
}
