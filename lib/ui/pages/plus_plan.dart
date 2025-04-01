import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/controllers/plan_controller.dart';

import 'package:prueba_uopp/ui/widgets/diagonal_container.dart';
import 'package:prueba_uopp/ui/widgets/features_plan.dart';

class PlusPlan extends StatefulWidget {
  const PlusPlan({super.key});

  @override
  State<PlusPlan> createState() => _PlusPlanState();
}

class _PlusPlanState extends State<PlusPlan> {
  final PlanController controller = Get.put(PlanController());

  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          FeaturesPlanWidget(
            planName: AppConfig.plusPlan,
            planPrice: AppConfig.pricePlus,
            planInfo: AppConfig.infoPlusPlan,
            planFeatures: AppConfig.plusFeatures,
            planColor: AppConfig.plusColor,
            featuresList: controller.plusPlan,
            txtColor: AppConfig.bgTextColor,
            asset: 'assets/icons/1.png',
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DiagonalContainer(),
          ),
        ],
      ),
    );
  }
}
