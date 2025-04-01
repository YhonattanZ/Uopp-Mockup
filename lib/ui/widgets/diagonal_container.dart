import 'package:flutter/material.dart';
import 'package:prueba_uopp/config/config.dart';

class DiagonalContainer extends StatelessWidget {
  final BorderRadiusGeometry? decoration;

  const DiagonalContainer({super.key, this.decoration});

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
        borderRadius:
            decoration ??
            BorderRadius.only(
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
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Promoción\n",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'CircularStd',
                            color: AppConfig.bgTextColor,
                            fontWeight: FontWeight.w400,
                            height: 0.8,
                          ),
                        ),
                        TextSpan(
                          text: "BIENVENIDA",
                          style: TextStyle(
                            fontFamily: 'CircularStd',
                            color: AppConfig.bgTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            height: 1.0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Primer mes\n",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'CircularStd',
                            color: AppConfig.bgTextColor,
                            fontWeight: FontWeight.w400,
                            height: 0.8,
                          ),
                        ),
                        TextSpan(
                          text: "GRATIS",
                          style: TextStyle(
                            fontFamily: 'CircularStd',
                            color: AppConfig.bgTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            height: 1.0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
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
