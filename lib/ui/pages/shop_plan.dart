import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/controllers/plan_controller.dart';

import 'package:prueba_uopp/ui/widgets/diagonal_container.dart';
import 'package:prueba_uopp/ui/widgets/features_plan.dart';

class ShopPlan extends StatefulWidget {
  const ShopPlan({super.key});

  @override
  State<ShopPlan> createState() => _ShopPlanState();
}

class _ShopPlanState extends State<ShopPlan> {
  final PlanController controller = Get.put(PlanController());

  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          FeaturesPlanWidget(
            planName: 'SHOP',
            planPrice: AppConfig.priceShop,
            planInfo: AppConfig.infoShopPlan,
            planFeatures: AppConfig.shopFeatures,
            planColor: Color(0xff9CFFC6),
            asset: 'assets/icons/2.png',
            featuresList: controller.shopPlan,
            txtColor: AppConfig.upgradeTextColor,
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
