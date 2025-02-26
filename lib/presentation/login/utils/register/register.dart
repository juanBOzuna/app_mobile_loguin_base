import 'package:equipos_lab_qr_scan/controllers/authController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  final Authcontroller authController;
  const RegisterPage({super.key, required this.authController});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 70,
      );
      if (image == null || !mounted) return;

      final File imageFile = File(image.path);

      if (imageFile.lengthSync() > 5 * 1024 * 1024) {
        Get.snackbar('Error', 'La imagen es demasiado grande');
        return;
      }

      setState(() {
        _image = imageFile;
      });
    } catch (e) {
      Get.snackbar('Error', 'Error al acceder: ${e.toString()}');
    }
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Elegir de la galería'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.authController.registerDto.value.image = _image;
      if (kDebugMode) {
        print(
            'Registrando: ${widget.authController.registerDto.value.email}, ${widget.authController.registerDto.value.name}, ${widget.authController.registerDto.value.password}');
      }

      widget.authController.register();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                    onTap: _showImageSourceDialog,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.grey[200],
                          backgroundImage:
                              _image == null ? null : FileImage(_image!),
                          child: _image == null
                              ? const Icon(Icons.camera_alt,
                                  size: 40, color: Colors.grey)
                              : null,
                        ),
                        if (_image != null)
                          GestureDetector(
                            onTap: () {
                              _image = null;

                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  )
                                ],
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          )
                      ],
                    )),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nombre Completo',
                            prefixIcon:
                                Icon(Icons.person, color: Colors.green[700]),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 1,
                              ),
                            ),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Ingrese su nombre' : null,
                          onSaved: (value) => widget.authController.registerDto
                              .value.name = value ?? ''),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Correo Electrónico',
                          prefixIcon:
                              Icon(Icons.email, color: Colors.green[700]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) =>
                            !value!.contains('@') ? 'Correo inválido' : null,
                        onSaved: (value) => widget.authController.registerDto
                            .value.email = value ?? '',
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            prefixIcon:
                                Icon(Icons.lock, color: Colors.green[700]),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) =>
                              value!.length < 6 ? 'Mínimo 6 caracteres' : null,
                          onSaved: (value) => widget.authController.registerDto
                              .value.password = value ?? ''),
                      const SizedBox(height: 30),
                      Obx(() => widget.authController.isChargingRegister.value
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  backgroundColor: Colors.green[700],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: _submitForm,
                                child: Text('Registrarse',
                                    style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                              ),
                            )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
