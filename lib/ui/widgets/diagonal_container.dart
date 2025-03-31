import 'package:flutter/material.dart';

class DiagonalContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            10,
          ), // 🔹 Esquina inferior izquierda redondeada
          bottomRight: Radius.circular(
            10,
          ), // 🔹 Esquina inferior derecha redondeada
        ),
      ),
      child: ClipRRect(
        // 🔹 Recortar el contenido para respetar los bordes redondeados
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

    // 🎨 Primera parte (75%) - Color superior izquierdo
    Path path1 =
        Path()
          ..moveTo(0, 0)
          ..lineTo(size.width * 0.75, 0) // 🔹 La diagonal comienza al 75%
          ..lineTo(0, size.height)
          ..close();

    paint.color = Colors.blue; // Color superior izquierdo
    canvas.drawPath(path1, paint);

    // 🎨 Segunda parte (25%) - Color inferior derecho
    Path path2 =
        Path()
          ..moveTo(size.width * 0.75, 0)
          ..lineTo(size.width, 0)
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..close();

    paint.color = Colors.red; // Color inferior derecho
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
