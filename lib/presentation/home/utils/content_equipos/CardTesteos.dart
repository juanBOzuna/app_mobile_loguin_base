import 'package:equipos_lab_qr_scan/controllers/equipos_controller.dart';
import 'package:equipos_lab_qr_scan/infraestructure/models/equipos/equipos_resp_model.dart';
import 'package:flutter/material.dart';

class CardTesteosWidget extends StatefulWidget {
  final Size sizeAct;
  final String linkFetchAll;
  final String title;
  final String ultimaFecha;
  final String certificado;
  final EquiposController equiposController;
  const CardTesteosWidget(
      {super.key,
      required this.sizeAct,
      required this.linkFetchAll,
      required this.ultimaFecha,
      required this.certificado,
      required this.equiposController,
      required this.title});

  @override
  State<CardTesteosWidget> createState() => _CardTesteosWidgetState();
}

class _CardTesteosWidgetState extends State<CardTesteosWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.sizeAct.width,
      child: Card(
        color: Colors.white,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ultima ${widget.title}: ${widget.ultimaFecha}',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 88, 88, 88),
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                'Certificado: ${widget.certificado}',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 88, 88, 88),
                  fontWeight: FontWeight.normal,
                ),
              ),
              // GestureDetector(
              //     onTap: () {},
              //     child: const Text(
              //       'Ver otras ↵',
              //       style: TextStyle(
              //         color: Colors.red,
              //         fontSize: 14,
              //         fontWeight: FontWeight.normal,
              //       ),
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
