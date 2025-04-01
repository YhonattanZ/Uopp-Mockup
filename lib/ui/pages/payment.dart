import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_uopp/config/config.dart';
import 'package:prueba_uopp/routes/app_routes.dart';
import 'package:prueba_uopp/ui/widgets/credit_card.dart';
import 'package:prueba_uopp/ui/widgets/custom_appbar.dart';
import 'package:prueba_uopp/ui/widgets/custom_button.dart';
import 'package:prueba_uopp/ui/widgets/custom_tag.dart';
import 'package:prueba_uopp/ui/widgets/resume_purchase_header.dart';

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
      body: ListView(
        children: [
          header('Método de pago'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffF4F5F6),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 310,
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

          promocionalCode(),
          header('Resumen de compra'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
              height: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),

                border: Border(
                  top: BorderSide(color: AppConfig.findPlanTextColor),
                  left: BorderSide(color: AppConfig.findPlanTextColor),
                  right: BorderSide(color: AppConfig.findPlanTextColor),
                ),
              ),
              child: ResumePurchaseHeader(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xff81ECCA),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                    child: Row(
                      children: [
                        Text(
                          'Total a pagar',
                          style: TextStyle(
                            fontFamily: 'CircularStd',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff2A6A57),
                          ),
                        ),
                        Text(
                          '....................................',
                          style: TextStyle(
                            fontFamily: 'CircularStd',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff2A6A57),
                          ),
                        ),
                        Text(
                          '9,99€',
                          style: TextStyle(
                            fontFamily: 'CircularStd',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff2A6A57),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        textAlign: TextAlign.end,
                        'más impuestos aplicables',
                        style: TextStyle(
                          fontFamily: 'CircularStd',
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff2A6A57),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/icons/info purple.png'),
                SizedBox(width: 10),
                Text(
                  'Cambia de plan en cualquier momento, no hay permanencia',
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppConfig.findPlanTextColor,
                  ),
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            title: 'Suscribirme',
            onPressed: () => Get.toNamed(AppRoutes.subscriptionPaid),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/logo.png'),
                SizedBox(width: 5),
                SizedBox(
                  width: 340,
                  child: Text(
                    textAlign: TextAlign.start,
                    AppConfig.terms,
                    style: TextStyle(
                      fontFamily: 'CircularStd',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppConfig.findPlanTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget promocionalCode() {
    return Padding(
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
    );
  }

  Widget header(String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
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
          SizedBox(height: 200, width: 350, child: CreditCardRow()),
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
          Image.asset('assets/icons/white check.png'),
        ],
      ),
    );
  }
}
