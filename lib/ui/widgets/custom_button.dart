import 'package:flutter/material.dart';
import 'package:prueba_uopp/config/config.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppConfig.planTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'CircularStd',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppConfig.bgTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
