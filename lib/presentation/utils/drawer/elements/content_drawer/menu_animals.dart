import 'package:equipos_lab_qr_scan/presentation/home/home.dart';
import 'package:flutter/material.dart';

class MenuItemAnimalsWidget extends StatelessWidget {
  const MenuItemAnimalsWidget({
    super.key,
    required this.widget,
  });

  final Home widget;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color: Color(0xFFfffffff),
      child: InkWell(
        onTap: () {
          widget.authController.logout();
        },
        child: const Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                Icons.pets,
                size: 28,
                color: Color(0xFF314f4d),
              )),
              Expanded(
                flex: 3,
                child: Text(
                  "Animales",
                  style: TextStyle(color: Color(0xFF314f4d), fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
