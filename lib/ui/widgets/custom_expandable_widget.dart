import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/controllers/plan_controller.dart';
import 'package:prueba_uopp/ui/widgets/custom_tag.dart';

class PlanFeaturesWidget extends StatefulWidget {
  const PlanFeaturesWidget({super.key});

  @override
  _PlanFeaturesWidgetState createState() => _PlanFeaturesWidgetState();
}

class _PlanFeaturesWidgetState extends State<PlanFeaturesWidget> {
  final PlanController controller = Get.put(PlanController());

  bool showAll = false; // Controla si se muestran todas las características

  @override
  Widget build(BuildContext context) {
    int visibleCount = 3;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 40,
            child: Wrap(
              children: [
                CustomTagWidget(
                  text: 'ENCUENTRA TU PLAN',
                  width: 300,
                  textColor: AppConfig.findPlanTextColor,
                  color: Color(0XFFE8EAEB),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          //Nombres de los planes
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(flex: 2, child: SizedBox()),
                Expanded(
                  child: _buildPlanTitle(
                    "Basic",
                    AppConfig.bgTextColor,
                    AppConfig.primaryTextColor,
                    44,
                  ),
                ),
                Expanded(
                  child: _buildPlanTitle(
                    "PLUS",
                    AppConfig.plusColor,
                    AppConfig.bgTextColor,
                    44,
                  ),
                ),
                Expanded(
                  child: _buildPlanTitle(
                    "Business",
                    AppConfig.businessColor,
                    AppConfig.bgTextColor,
                    64,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(flex: 4, child: Text("Desde", style: _headerStyle())),
                SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Text(
                    "€0",
                    style: _headerStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "€9",
                    style: _headerStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "€49",
                    style: _headerStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset('assets/icons/info icon.png'),
                SizedBox(width: 8),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),

          ...controller.features
              .take(showAll ? controller.features.length : visibleCount)
              .map(
                (feature) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(feature["name"], style: _textStyle()),
                          ),
                          Expanded(
                            flex: 2,
                            child: _buildIcon(feature["basic"]),
                          ),
                          Expanded(flex: 2, child: _buildIcon(feature["plus"])),
                          Expanded(
                            flex: 2,
                            child: _buildIcon(feature["business"]),
                          ),
                          Expanded(
                            flex: 1,
                            child: Image.asset('assets/icons/info icon.png'),
                          ), // Icono info
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(),
                    ),
                  ],
                ),
              ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Divider(color: AppConfig.planTextColor)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        showAll = !showAll;
                      });
                    },
                    child: Text(
                      showAll ? 'Mostrar menos' : 'Mostrar más',
                      style: TextStyle(
                        fontFamily: 'CircularStd',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppConfig.planTextColor,
                      ),
                    ),
                  ),
                ),
                Expanded(child: Divider(color: AppConfig.planTextColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget para el título de cada plan (Basic, Plus, Business)
  Widget _buildPlanTitle(
    String title,
    Color bgColor,
    Color textColor,
    double width,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: textColor),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontFamily: 'CircularStd',
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildIcon(bool value) {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        value ? 'assets/icons/Yes.png' : 'assets/icons/No.png',
      ),
    );
  }

  // Estilos de texto
  TextStyle _headerStyle() => TextStyle(
    fontFamily: 'CircularStd',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppConfig.findPlanTextColor,
  );
  TextStyle _textStyle() => TextStyle(
    fontFamily: 'CircularStd',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppConfig.findPlanTextColor,
  );
}
