import 'package:flutter/material.dart';

class Catalogo extends StatelessWidget {
  const Catalogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Servicios'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('Consultas Veterinarias'),
            subtitle: Text('Revisiones y diagnósticos para mascotas.'),
            leading: Icon(Icons.pets),
          ),
          ListTile(
            title: Text('Vacunación'),
            subtitle: Text('Vacunas para prevenir enfermedades en mascotas.'),
            leading: Icon(Icons.medical_services), // Ícono corregido
          ),
          ListTile(
            title: Text('Cirugía'),
            subtitle: Text('Procedimientos quirúrgicos para mascotas.'),
            leading: Icon(Icons.local_hospital),
          ),
          ListTile(
            title: Text('Peluquería Canina'),
            subtitle: Text('Baños y cortes de pelo para perros.'),
            leading: Icon(Icons.cut), // Ícono corregido
          ),
          ListTile(
            title: Text('Guardería'),
            subtitle: Text('Cuidado temporal para mascotas.'),
            leading: Icon(Icons.pets),
          ),
        ],
      ),
    );
  }
}
