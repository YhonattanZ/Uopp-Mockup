import 'package:get/get.dart';
import '../ui/pages/home.dart';

class AppRoutes {
  static const HOME = '/';

  static final routes = [GetPage(name: HOME, page: () => HomePage())];
}
