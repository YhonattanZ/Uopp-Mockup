import 'package:flutter/material.dart';
import 'package:prueba_uopp/config/config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBack;
  double? height;

  CustomAppBar({
    super.key,
    required this.title,
    required this.onBack,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: Icon(Icons.arrow_back_ios, color: AppConfig.bgTextColor),
          ),
          Text(
            title,
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
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Color(0xffB5AEFF), Color(0xff9688FF)],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
