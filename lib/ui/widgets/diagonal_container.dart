import 'package:flutter/material.dart';
import 'package:prueba_uopp/config/config.dart';

class DiagonalContainer extends StatelessWidget {
  const DiagonalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        child: CustomPaint(painter: DiagonalPainter()),
      ),
    );
  }
}

class DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    Path path1 =
        Path()
          ..moveTo(0, 0)
          ..lineTo(size.width * 0.70, 0) // 🔹 La diagonal comienza al 70%
          ..lineTo(size.width * 0.60, size.height)
          ..lineTo(0, size.height) // Ajuste para mover la base
          ..close();

    paint.color = AppConfig.welcomePromoColor;
    canvas.drawPath(path1, paint);

    Path path2 =
        Path()
          ..moveTo(size.width * 0.70, 0)
          ..lineTo(size.width, 0)
          ..lineTo(size.width, size.height)
          ..lineTo(size.width * 0.60, size.height) // Ajuste para mover la base
          ..close();

    paint.color = AppConfig.upgradeTextColor;
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
