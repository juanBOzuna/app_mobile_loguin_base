import 'package:equipos_lab_qr_scan/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TopDrawer extends StatelessWidget {
  const TopDrawer({
    super.key,
    required this.widget,
  });

  final Home widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        // Text(
        //   'Hola👋',
        //   style: GoogleFonts.openSans(
        //       letterSpacing: 3,
        //       color: Color(0xFFfffffff),
        //       fontSize: 25,
        //       fontWeight: FontWeight.bold

        //       ),
        //   textAlign: TextAlign.center,

        // ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Get.dialog(
              Dialog(
                child: InteractiveViewer(
                  child: Image.network(
                    widget.authController.user.value.picture!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
          child: CircleAvatar(
            radius: 90,
            backgroundColor: Colors.green,
            backgroundImage: NetworkImage(
              widget.authController.user.value.picture ?? '',
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          '${widget.authController.user.value.name}' ?? '',
          style: GoogleFonts.openSans(
              letterSpacing: 3,
              color: Color(0xFF314f4d),
              fontSize: 18,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
