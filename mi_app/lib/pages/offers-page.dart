import 'package:flutter/material.dart';

class OfertasPage extends StatefulWidget {
  @override
  _OfertasPageState createState() => _OfertasPageState();
}

class _OfertasPageState extends State<OfertasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Text(
          'Esta es la página de Ofertas.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
