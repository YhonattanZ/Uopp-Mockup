import 'package:flutter/material.dart';

class CustomTagWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double width;

  const CustomTagWidget({
    super.key,
    required this.text,
    this.color = Colors.blue,
    this.width = 130,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TagClipper(),
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(color: color),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'CircularStd',
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

// Clipper personalizado con curva más redondeada
class TagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Esquina superior izquierda (redondeada)
    path.moveTo(20, 0);
    path.quadraticBezierTo(0, 0, 0, 20);

    // Borde izquierdo plano
    path.lineTo(0, size.height);

    // Línea inferior hasta el 75% del ancho
    path.lineTo(size.width * 0.75, size.height);

    // Curva más redonda y uniforme hasta la esquina superior derecha
    path.quadraticBezierTo(
      size.width * 1,
      size.height * 0.8, // Punto de control más alto
      size.width,
      size.height * 0.1, // Punto final más curvado
    );

    // Línea recta en la parte superior
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
