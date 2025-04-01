import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        switchTheme: SwitchThemeData(
          trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.selected)) {
              return AppConfig.planTextColor;
            }
            return Color(0xffD5D8DB); // Borde cuando está desactivado
          }),
          trackOutlineWidth: WidgetStateProperty.all(2), // Grosor del borde
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX App',
      initialRoute: AppRoutes.HOME,
      getPages: AppRoutes.routes,
    );
  }
}
