import 'package:equipos_lab_qr_scan/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  final Authcontroller authController;
  const Home({super.key, required this.authController});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 200,
                color: Colors.grey[200],
                child: Image.network(
                    'https://fotografias.lasexta.com/clipping/cmsimages02/2019/11/14/66C024AF-E20B-49A5-8BC3-A21DD22B96E6/default.jpg?crop=1300,731,x0,y0&width=1280&height=720&optimize=low'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 100),
                child: const Column(
                  children: [
                    Material(
                      child: InkWell(
                        // onTap: () {

                        // },
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Expanded(child: Icon(Icons.logout, size: 20)),
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Logout",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
