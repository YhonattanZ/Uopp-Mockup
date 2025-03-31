import 'package:flutter/material.dart';
import 'package:prueba_uopp/config/config.dart';

class DiagonalContainer extends StatelessWidget {
  const DiagonalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
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
        child: CustomPaint(
          painter: DiagonalPainter(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Row(
              children: [
                Image.asset('assets/icons/promo.png'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Promoción',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'CircularStd',
                          fontSize: 12,
                          color: AppConfig.bgTextColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'BIENVENIDA',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'CircularStd',
                          fontSize: 28,
                          color: AppConfig.bgTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(children: [Text('Primer mes')]),
              ],
            ),
          ),
        ),
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
