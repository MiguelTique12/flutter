import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mi_app/service/personService.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilInfo extends StatefulWidget {
  @override
  _PerfilInfoState createState() => _PerfilInfoState();
}

class _PerfilInfoState extends State<PerfilInfo> {
  File? _image; // Imagen de usuario
  File? _documentImage; // Imagen del documento
  final ImagePicker _picker = ImagePicker();
  final Personservice _personService = Personservice();
  final TextEditingController _nombresController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _perfilController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _documentoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  String _tipoDocumento = 'Cédula de ciudadanía (CC)';

  Future<void> _pickImage({bool isDocument = false}) async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isDocument) {
          _documentImage = File(pickedFile.path);
        } else {
          _image = File(pickedFile.path);
        }
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> _updateUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final personId = prefs.getString('personId');

    if (personId == null) {
      print('No se encontró el ID del usuario.');
      return;
    }

    final base64DocumentImage =
        _documentImage != null ? await _imageToBase64(_documentImage!) : '';
    final base64Image = _image != null ? await _imageToBase64(_image!) : '';

    // Pasamos el contexto aquí
    await _personService.updatePersonData(
      context,
      _nombresController.text,
      _apellidosController.text,
      _tipoDocumento,
      _documentoController.text,
      base64DocumentImage,
      _fechaController.text,
      _correoController.text,
      true, // Aquí puedes cambiarlo según el género
      _perfilController.text, // Username
      base64Image // Foto de perfil
    );
  }

  Future<String> _imageToBase64(File image) async {
    final imageBytes = await image.readAsBytes();
    return base64Encode(imageBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar datos'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/fondo.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo.png'),
                    radius: 40,
                  ),
                  SizedBox(height: 20),
                  _buildProfileImage(),
                  SizedBox(height: 20),
                  _buildTextField('Nombres', _nombresController),
                  _buildTextField('Apellidos', _apellidosController),
                  _buildTextField('Nombre de perfil', _perfilController),
                  _buildTextField('Correo electrónico', _correoController),
                  _buildTextField('Fecha de nacimiento', _fechaController, isDate: true),
                  _buildDropdownField(),
                  SizedBox(height: 10),
                  _buildTextField('Nº de documento', _documentoController),
                  _buildDocumentField('Subir documento de identidad'),
                  _buildTextField('Teléfono', _telefonoController),
                  SizedBox(height: 20),
                  _buildActionButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return GestureDetector(
      onTap: () => _pickImage(),
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.grey[200],
        backgroundImage: _image != null ? FileImage(_image!) : null,
        child: _image == null
            ? Icon(Icons.add_a_photo, size: 40, color: Colors.grey)
            : null,
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isDate = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: isDate ? Icon(Icons.calendar_today) : null,
          border: OutlineInputBorder(),
        ),
        readOnly: isDate,
        onTap: () => isDate ? _selectDate(context) : null,
      ),
    );
  }

  Widget _buildDropdownField() {
    return DropdownButtonFormField<String>(
      value: _tipoDocumento,
      items: [
        'Cédula de ciudadanía (CC)',
        'Tarjeta de Identidad (TI)',
        'Cédula de Extranjería (CE)',
        'Pasaporte (PP)',
      ].map((value) => DropdownMenuItem(value: value, child: Text(value))).toList(),
      onChanged: (newValue) {
        setState(() {
          _tipoDocumento = newValue!;
        });
      },
      decoration: InputDecoration(
        labelText: 'Tipo de documento',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDocumentField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => _pickImage(isDocument: true),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyle(fontSize: 16)),
              if (_documentImage != null)
                Image.file(_documentImage!, width: 40, height: 40),
              Icon(Icons.upload_file),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: _updateUserData,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          child: Text('Actualizar'),
        ),
        ElevatedButton(
          onPressed: () {
            // Acción de eliminar cuenta
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text('Eliminar cuenta'),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        // Convierte a formato ISO 8601
        _fechaController.text = picked.toIso8601String();
      });
    }
  }
}
