import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:prueba_uopp/config/config.dart';

class CreditCardRow extends StatefulWidget {
  const CreditCardRow({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreditCardRowState createState() => _CreditCardRowState();
}

class _CreditCardRowState extends State<CreditCardRow> {
  List<Map<String, String>> cards = [
    {
      'cardNumber': '4242 4242 4242 4242',
      'expiryDate': '12/25',
      'cardHolderName': 'Juan Pérez',
      'cvvCode': '123',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...cards.map((card) => _buildCreditCard(card)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: _buildAddCardButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditCard(Map<String, String> card) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CreditCardWidget(
        height: 220,
        width: 280,
        cardNumber: card['cardNumber']!,
        expiryDate: card['expiryDate']!,
        cardHolderName: card['cardHolderName']!,
        cvvCode: card['cvvCode']!,
        showBackView: false,
        onCreditCardWidgetChange: (CreditCardBrand brand) {},
      ),
    );
  }

  Widget _buildAddCardButton() {
    return GestureDetector(
      onTap: () {
        // Agregar nueva tarjeta
      },
      child: Container(
        height: 100,
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppConfig.planTextColor, width: 2),
        ),
        child: Icon(Icons.add, size: 50, color: AppConfig.planTextColor),
      ),
    );
  }
}
