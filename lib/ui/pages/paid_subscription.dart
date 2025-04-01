import 'package:flutter/material.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/ui/widgets/custom_button.dart';

class PaidSubscription extends StatelessWidget {
  const PaidSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomElevatedButton(
        title: 'Aceptar',
        onPressed: () {},
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 220,
            child: Stack(
              children: [
                Center(
                  child: ClipPath(
                    clipper: const ShapeBorderClipper(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(130)),
                      ),
                    ),
                    child: SizedBox(
                      width: 160,
                      height: 160,
                      child: Image.asset(
                        'assets/images/image.jpg',

                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 160,
                  child: Center(
                    child: ClipPath(
                      clipper: const ShapeBorderClipper(
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(120)),
                        ),
                      ),
                      child: Container(
                        width: 70,
                        height: 70,
                        color: AppConfig.plusColor,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              AppConfig.plusPlan,
                              style: TextStyle(
                                fontFamily: 'CircularStd',
                                color: AppConfig.bgTextColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '¡Suscripción realizada!',
              style: TextStyle(
                fontFamily: 'CircularStd',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppConfig.primaryTextColor,
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: Text(
              textAlign: TextAlign.center,
              AppConfig.subscription,
              style: TextStyle(
                fontFamily: 'CircularStd',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppConfig.primaryTextColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Divider(color: AppConfig.planTextColor)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'DISFRUTALO',
                    style: TextStyle(
                      fontFamily: 'CircularStd',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppConfig.planTextColor,
                    ),
                  ),
                ),
                Expanded(child: Divider(color: AppConfig.planTextColor)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.asset('assets/images/firma.png'),
          ),
        ],
      ),
    );
  }
}
