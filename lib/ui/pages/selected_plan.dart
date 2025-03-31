import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/ui/widgets/custom_appbar.dart';

class SelectedPlan extends StatefulWidget {
  const SelectedPlan({super.key});

  @override
  State<SelectedPlan> createState() => _SelectedPlanState();
}

class _SelectedPlanState extends State<SelectedPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Plan PLUS', onBack: () => Get.back()),
    );
  }
}
