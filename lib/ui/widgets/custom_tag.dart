import 'package:flutter/material.dart';

class CustomTagWidget extends StatelessWidget {
  final String text;

  String? subtitle;
  final Color color;
  final Color textColor;
  final double width;
  final double textSize;
  final TextAlign? align;
  Widget? icon;

  CustomTagWidget({
    super.key,
    required this.text,
    this.icon,
    this.color = Colors.blue,
    this.width = 130,
    this.textSize = 24,
    required this.textColor,
    this.align,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TagClipper(),
      child: Container(
        height: 40,
        width: width,

        decoration: BoxDecoration(color: color),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Row(
            mainAxisAlignment:
                subtitle != null
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: icon ?? SizedBox(),
              ),
              Text(
                text,
                textAlign: align,
                style: TextStyle(
                  fontSize: textSize,
                  fontFamily: 'CircularStd',
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle != null
                  ? Text(
                    subtitle ?? '',
                    textAlign: align,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'CircularStd',
                      color: textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                  : SizedBox(),
            ],
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
    path.moveTo(10, 0);
    path.quadraticBezierTo(0, 0, 0, 10);

    // Borde izquierdo plano
    path.lineTo(0, size.height);

    // Línea inferior hasta el 75% del ancho
    path.lineTo(size.width * 0.75, size.height);

    // Curva más redonda y uniforme hasta la esquina superior derecha
    path.quadraticBezierTo(
      size.width * 1,
      size.height * 0.9, // Punto de control más alto
      size.width,
      size.height * 0.15, // Punto final más curvado
    );

    // Línea recta en la parte superior
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
