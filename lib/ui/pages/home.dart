import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios, color: AppConfig.bgTextColor),
            ),
            Text(
              AppConfig.selectPlan,
              textAlign: TextAlign.left,

              style: TextStyle(
                fontFamily: 'CircularStd',
                color: AppConfig.bgTextColor,
                fontSize: 24,
                // fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          height: 95,
          padding: EdgeInsets.fromLTRB(16, 55, 16, 10),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Color(0xffB5AEFF), Color(0xff9688FF)],
            ),
          ),
        ),
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
