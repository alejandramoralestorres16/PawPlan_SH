import 'package:flutter/material.dart';
import '../Model/agenda.dart';
import 'catalogo.dart';

class Inicio extends StatelessWidget {
   const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clínica Veterinaria'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.pets, size: 100.0, color: Colors.blue), // Icono de Flutter
            const SizedBox(height: 20.0),
            const Text(
              '¡Bienvenido a la PawnVet!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Agenda()),
                );
              },
              icon: const Icon(Icons.event),
              label: const Text('Ver Agenda de Citas'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Catalogo()),
                );
              },
              icon: const Icon(Icons.menu_book),
              label: const Text('Ver Catálogo de Servicios'),
            ),
          ],
        ),
      ),
    );
  }
}
