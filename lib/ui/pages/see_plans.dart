import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/controllers/plan_controller.dart';
import 'package:prueba_uopp/routes/app_routes.dart';
import 'package:prueba_uopp/ui/pages/plus_plan.dart';
import 'package:prueba_uopp/ui/pages/shop_plan.dart';
import 'package:prueba_uopp/ui/widgets/custom_appbar.dart';
import 'package:prueba_uopp/ui/widgets/custom_button.dart';

class SeePlans extends StatefulWidget {
  const SeePlans({super.key});

  @override
  State<SeePlans> createState() => _SeePlansState();
}

class _SeePlansState extends State<SeePlans> {
  final PlanController controller = Get.put(PlanController());

  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomElevatedButton(
        title: 'Seleccionar',
        onPressed: () => Get.toNamed(AppRoutes.selectedPlanPage),
      ),
      appBar: CustomAppBar(
        title: AppConfig.selectPlan,
        onBack: () => Get.back(),
      ),
      body: PageView(children: [PlusPlan(), ShopPlan()]),
    );
  }
}
