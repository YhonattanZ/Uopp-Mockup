import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/ui/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppConfig.selectPlan,
        onBack: () => Get.back(),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed:
              () => Get.snackbar('Hola', 'Bienvenido a Flutter con GetX'),
          child: Text('Mostrar Snackbar'),
        ),
      ),
    );
  }
}
