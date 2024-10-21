import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Necesario para SystemNavigator.pop()
import 'package:mi_app/main.dart';
import 'package:mi_app/models/TravelPackage.dart';
import 'package:mi_app/models/person.dart';
import 'package:mi_app/pages/InicioPage.dart';
import 'package:mi_app/pages/PerfilPage.dart';
import 'package:mi_app/pages/us-page.dart';
import 'package:mi_app/pages/offers-page.dart';
import 'package:mi_app/pages/travel-page.dart';
import 'package:mi_app/service/userService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future<List<TravelPackage>> travelPackages;
  String nombreUsuario = ''; // Nombre desde la base de datos
  String? base64ProfilePhoto; // Almacenamos la foto de perfil en base64
  Widget _currentPage = InicioPage(); // Página inicial por defecto
  final UserService userService = UserService();
  
  @override
  void initState() {
    super.initState();
    _findUser();
  }

  // Método para mostrar el diálogo de confirmación
  Future<bool> _showExitConfirmationDialog() async {
    return await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('¿Deseas salir de la aplicación?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text('Aceptar'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  Future<void> _findUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');

    if (username != null) {
      final userData = await userService.findUserByName(username);
      if (userData != null) {
        print('Usuario encontrado: $userData');
        final personaData = Persona.fromJson(userData['personId']);
        base64ProfilePhoto = userData['profilePhoto']; // Asignamos la foto base64

        // Verificar si los datos relevantes están llenos
        final isComplete = personaData.names != null &&
            personaData.lastName != null &&
            personaData.email != null;

        setState(() {
          nombreUsuario = isComplete
              ? '${personaData.names} ${personaData.lastName}'
              : 'Usuario Desconocido';
        });
      } else {
        print('No se encontró el usuario.');
      }
    } else {
      print('No se encontró el nombre de usuario.');
    }
  }

  void _navigateTo(Widget page) {
    setState(() {
      _currentPage = page; // Cambia la página actual
    });
    Navigator.pop(context); // Cierra el menú
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _showExitConfirmationDialog();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Golden Travel'),
          backgroundColor: Color(0xFFD98000), // Color personalizado para el AppBar
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color(0xFFD98000),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/imagologoblack.png', // Coloca tu logo aquí
                            width: 200,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                    // Menú de navegación
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Inicio'),
                      onTap: () => _navigateTo(InicioPage()), // Cambiar a InicioPage
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text('Nosotros'),
                      onTap: () => _navigateTo(NosotrosPage()), // Cambiar a NosotrosPage
                    ),
                    ListTile(
                      leading: Icon(Icons.map),
                      title: Text('Viajes'),
                      onTap: () => _navigateTo(ViajesPage()), // Cambiar a ViajesPage
                    ),
                    ListTile(
                      leading: Icon(Icons.local_offer),
                      title: Text('Ofertas'),
                      onTap: () => _navigateTo(OfertasPage()), 
                    ),
                    ListTile(
                      leading: Icon(Icons.logout_outlined),
                      title: Text('Salir'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _showUserInfo(),
              ),
            ],
          ),
        ),
        body: Container(
          color: Color(0xFFD98000), 
          child: _currentPage,
        ),
      ),
    );
  }

  Widget _showUserInfo() {
    if (nombreUsuario.isNotEmpty && nombreUsuario != "Usuario Desconocido") {
      return ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: base64ProfilePhoto != null
              ? MemoryImage(base64Decode(base64ProfilePhoto!))
              : null,
          child: base64ProfilePhoto == null
              ? Icon(Icons.person, size: 20)
              : null,
        ),
        title: Text(nombreUsuario),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PerfilInfo()),
          );
        },
        tileColor: Colors.transparent,
        hoverColor: Color(0xFFD98000),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PerfilInfo()),
          );
        },
        child: Text("Ven y completa tus datos"),
      );
    }
  }
}
