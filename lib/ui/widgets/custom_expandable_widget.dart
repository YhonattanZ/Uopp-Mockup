import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/controllers/plan_controller.dart';

class PlanFeaturesWidget extends StatefulWidget {
  @override
  _PlanFeaturesWidgetState createState() => _PlanFeaturesWidgetState();
}

class _PlanFeaturesWidgetState extends State<PlanFeaturesWidget> {
  final PlanController controller = Get.put(PlanController());

  bool showAll = false; // Controla si se muestran todas las características

  @override
  Widget build(BuildContext context) {
    int visibleCount =
        3; // Cantidad de características visibles antes de expandir

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          //Nombres de los planes
          Row(
            children: [
              Expanded(child: SizedBox()),
              Expanded(child: _buildPlanTitle("Basic", Colors.blue, 44)),
              Expanded(child: _buildPlanTitle("Plus", Colors.purple, 44)),
              Expanded(child: _buildPlanTitle("Business", Colors.orange, 64)),
            ],
          ),

          SizedBox(height: 5),

          // Fila con los precios
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("Desde", style: _headerStyle()),
              ), // Mantiene espacio vacío arriba
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
            ],
          ),

          Divider(),

          // Lista de características alineadas correctamente
          ...controller.features
              .take(showAll ? controller.features.length : visibleCount)
              .map(
                (feature) => Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(feature["name"], style: _textStyle()),
                        ),
                        Expanded(flex: 2, child: _buildIcon(feature["basic"])),
                        Expanded(flex: 2, child: _buildIcon(feature["plus"])),
                        Expanded(
                          flex: 2,
                          child: _buildIcon(feature["business"]),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(Icons.info_outline, color: Colors.grey),
                        ), // Icono info
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),

          // Botón "Mostrar más / Mostrar menos" centrado con líneas arriba y abajo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(),
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      showAll = !showAll;
                    });
                  },
                  child: Text(
                    showAll ? "Mostrar menos" : "Mostrar más",
                    style: TextStyle(
                      color: AppConfig.planTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }

  // Widget para el título de cada plan (Basic, Plus, Business)
  Widget _buildPlanTitle(String title, Color color, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        padding: EdgeInsets.only(top: 5),
        width: width,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: color),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontFamily: 'CircularStd',
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Icono de check o X alineado
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
