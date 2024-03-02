import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'agendC.dart';
import '../Model/agenda.dart';
class Cita {
  final String titulo;
  final String descripcion;
  final DateTime fecha;

  Cita({
    required this.titulo,
    required this.descripcion,
    required this.fecha,
  });
}

