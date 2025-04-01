import 'package:get/get.dart';

class CreditCardController extends GetxController {
  final List<Map<String, String>> cards = [
    {
      'number': '4242 4242 4242 4242',
      'expiry': '12/26',
      'holder': 'Juan Pérez',
      'cvv': '123',
    },
  ];
}
