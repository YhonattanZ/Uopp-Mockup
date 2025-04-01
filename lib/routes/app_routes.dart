import 'package:get/get.dart';
import 'package:prueba_uopp/ui/pages/payment.dart';
import 'package:prueba_uopp/ui/pages/see_plans.dart';
import 'package:prueba_uopp/ui/pages/selected_plan.dart';
import '../ui/pages/home.dart';

class AppRoutes {
  static const HOME = '/';
  static const plansPage = '/plans';
  static const selectedPlanPage = '/selected';
  static const subscriptionPaid = '/subscription';
  static const payment = '/payment';

  static final routes = [
    GetPage(name: HOME, page: () => HomePage()),
    GetPage(name: plansPage, page: () => SeePlans()),
    GetPage(name: selectedPlanPage, page: () => SelectedPlan()),
    GetPage(name: payment, page: () => PaymentPage()),
  ];
}
