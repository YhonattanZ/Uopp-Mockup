import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/ui/widgets/custom_appbar.dart';
import 'package:prueba_uopp/ui/widgets/custom_tag.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Pago', onBack: () => Get.back()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffF4F5F6),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 250,
              width: double.infinity,
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.all(10.0), child: wallet()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Expanded(child: Divider()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: creditCard(),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffF4F5F6),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 40,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTagWidget(
                    subtitle: '',
                    icon: Image.asset('assets/icons/codigo.png'),
                    text: 'CODIGO PROMOCIONAL',
                    textSize: 14,
                    textColor: AppConfig.bgTextColor,
                    width: 240,
                    color: Color(0xffD5D8DB),
                  ),
                  Image.asset('assets/icons/info icon 2.png'),
                  Switch(
                    value: isSwitched,
                    onChanged: (s) {
                      setState(() {
                        isSwitched = s;
                      });
                    },
                    inactiveThumbColor: Color(0xffD5D8DB),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'Método de pago',
        style: TextStyle(
          fontFamily: 'CircularStd',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppConfig.findPlanTextColor,
        ),
      ),
    );
  }

  Widget creditCard() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Image.asset('assets/icons/credit card.png'),
                    SizedBox(width: 5),
                    Text(
                      'Tarjeta bancaria',
                      style: TextStyle(
                        fontFamily: 'CircularStd',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppConfig.planTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset('assets/icons/Yes.png'),
            ],
          ),

          //TARJETA DE CREDITO
        ],
      ),
    );
  }

  Widget wallet() {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [
                Image.asset('assets/icons/wallet.png'),
                SizedBox(width: 10),
                Text(
                  'Monedero',
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppConfig.planTextColor,
                  ),
                ),
              ],
            ),
          ),
          Image.asset('assets/icons/Yes.png'),
        ],
      ),
    );
  }
}
