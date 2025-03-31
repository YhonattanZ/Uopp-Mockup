import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/routes/app_routes.dart';
import 'package:prueba_uopp/ui/widgets/custom_appbar.dart';
import 'package:prueba_uopp/ui/widgets/custom_button.dart';

class SeePlans extends StatelessWidget {
  const SeePlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomElevatedButton(
        title: 'Seleccionar',
        onPressed: () => Get.toNamed(AppRoutes.plansPage),
      ),
      appBar: CustomAppBar(
        title: AppConfig.selectPlan,
        onBack: () => Get.back(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
