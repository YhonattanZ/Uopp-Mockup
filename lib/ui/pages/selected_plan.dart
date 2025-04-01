import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/controllers/plan_controller.dart';
import 'package:prueba_uopp/routes/app_routes.dart';
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

  bool isAllow = false;

  @override
  void dispose() {
    super.dispose();
    controller.selectPlan(-1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Plan PLUS', onBack: () => Get.back()),
      bottomNavigationBar:
          controller.selectedPlanIndex.value == -1
              ? CustomElevatedButton(title: 'Seleccionar', onPressed: () {})
              : CustomElevatedButton(
                title: 'Continuar',
                onPressed: () => Get.toNamed(''),
              ),

      body: ListView.builder(
        itemCount: controller.plans.length,
        itemBuilder: (context, i) {
          return Obx(() {
            bool isSelected = controller.selectedPlanIndex.value == i;

            return GestureDetector(
              onTap: () {
                controller.selectPlan(i);
                setState(() {});
              },

              child: Column(
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
                    child: DiagonalContainer(
                      decoration:
                          isSelected
                              ? BorderRadius.zero
                              : BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                    ),
                  ),
                  Visibility(
                    visible: isSelected,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppConfig.planTextColor,
                              width: 2,
                            ),
                            left: BorderSide(
                              color: AppConfig.planTextColor,
                              width: 2,
                            ),
                            right: BorderSide(
                              color: AppConfig.planTextColor,
                              width: 2,
                            ),
                          ),
                          color: Color(0xffE9E7FF),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Plan seleccionado',
                            style: TextStyle(
                              fontFamily: 'CircularStd',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppConfig.planTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
