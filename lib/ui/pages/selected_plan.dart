import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/controllers/plan_controller.dart';
import 'package:prueba_uopp/ui/widgets/custom_appbar.dart';
import 'package:prueba_uopp/ui/widgets/custom_button.dart';
import 'package:prueba_uopp/ui/widgets/diagonal_container.dart';

import 'package:prueba_uopp/ui/widgets/plus_card.dart';

class SelectedPlan extends StatefulWidget {
  const SelectedPlan({super.key});

  @override
  State<SelectedPlan> createState() => _SelectedPlanState();
}

class _SelectedPlanState extends State<SelectedPlan> {
  final PlanController controller = Get.put(PlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Plan PLUS', onBack: () => Get.back()),
      bottomNavigationBar: CustomElevatedButton(
        title: 'Seleccionar',
        onPressed: () {},
      ),

      body: ListView.builder(
        itemCount: controller.plans.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              PlusCard(
                index: i,
                subtext: ' - Plan ${controller.plans[i]["days"]}',
                planName: AppConfig.plusPlan,
                planPrice: AppConfig.pricePlus,
                planColor: AppConfig.plusColor,
                txtColor: AppConfig.bgTextColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DiagonalContainer(),
              ),
            ],
          );
        },
      ),
    );
  }
}
