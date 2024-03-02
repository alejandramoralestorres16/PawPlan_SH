import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../Model/agenda.dart';
import 'cita.dart';

class _AgendaState extends State<Agenda> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay;
  Map<DateTime, List<dynamic>> _events = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda de Citas'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TableCalendar(
            firstDay: DateTime.utc(2021, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: _events.length,
              itemBuilder: (context, index) {
                DateTime date = _events.keys.elementAt(index);
                List<dynamic>? events = _events[date];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${date.day}/${date.month}/${date.year}',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: events?.length,
                      itemBuilder: (context, index) {
                        String event = events![index];
                        return ListTile(
                          title: Text(event),
                          subtitle: Text('Descripción de la cita'),
                          onTap: () {
                            // Acción al hacer clic en la cita
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción al hacer clic en el botón de agregar cita
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
