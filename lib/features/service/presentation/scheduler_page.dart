import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime _selectedDate = DateTime.now();
  int _selectedHour = 11;

  List<int> hours = [10, 11, 12];
  List<int> minutes = [0, 15, 30];

  void _onDateSelected(DateTime date) {
    setState(() => _selectedDate = date);
  }

  void _onHourSelected(int hour) {
    setState(() => _selectedHour = hour);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Servicio de plomería'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '¿Cuándo deseas agendar?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 300,
            child: CalendarDatePicker(
              initialDate: _selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 60)),
              onDateChanged: _onDateSelected,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              '¿Qué horario funciona mejor para ti?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: hours.length,
              itemBuilder: (context, index) {
                final hour = hours[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text("${hour.toString().padLeft(2, '0')} AM"),
                    selected: _selectedHour == hour,
                    onSelected: (_) => _onHourSelected(hour),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Acción al continuar
                },
                child: const Text('Continuar'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
