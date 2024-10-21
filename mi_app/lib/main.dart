import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mi_app/models/login.dart';
import 'package:mi_app/pages/dashboard-page.dart';
import 'package:mi_app/pages/imageSpinner.dart';
import 'package:mi_app/pages/register-person-page.dart';
import 'package:mi_app/pages/welcomeLogin.dart';
import 'package:mi_app/service/authService.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Golden Travel Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
      initialRoute: '/main',
      routes: {
        '/init': (context) => welcomeLogin(), // Pantalla inicial
        '/login': (context) => LoginPage(), // Pantalla de login
        '/register': (context) => PersonInfo(), // Pantalla de registro
        '/dashboard': (context) => DashboardPage(),
        '/Person': (context) => PersonInfo(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fondo.png'), // Imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Llamada al widget del spinner
          ImageSpinner(
            imagePath: 'assets/images/logo.png', // Imagen del logo
            duration: const Duration(seconds: 6), // Duración del spinner
            onFinish: () {
              // Al finalizar el spinner, navega a la página de login
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;
    login? user = await _authService.loginUser(email, password);

    setState(() {
      _isLoading = false;
    });
  
    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al iniciar sesión')),
      );
    }
  }

  Future<bool> _showExitConfirmationDialog() async {
    return await showDialog(
      context: context,
      barrierDismissible: false, // Evita cerrar el diálogo tocando fuera
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¿Deseas salir de la aplicación?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancelar y seguir en la app
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop(); // Cerrar la aplicación
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _showExitConfirmationDialog(); // Manejar el botón de retroceso
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/fondo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Image.asset('assets/images/logo.png', height: 250),
                    ),
                    const Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Nombre de usuario',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 152, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Ingresar',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonInfo()),
                        );
                      },
                      child: const Text(
                        "No tienes una cuenta? Regístrate",
                        style:
                            TextStyle(color: Color.fromARGB(255, 4, 50, 88)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SignInButton(
                      Buttons.Facebook,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    SignInButton(
                      Buttons.Google,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}