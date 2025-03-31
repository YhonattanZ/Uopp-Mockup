import 'package:get/get.dart';
import 'package:prueba_uopp/ui/pages/see_plans.dart';
import '../ui/pages/home.dart';

class AppRoutes {
  static const HOME = '/';
  static const plansPage = '/plans';

  static final routes = [
    GetPage(name: HOME, page: () => HomePage()),
    GetPage(name: plansPage, page: () => SeePlans()),
  ];
}
