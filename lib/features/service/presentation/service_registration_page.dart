import 'package:flutter/material.dart';

class ServiceRegistrationPage extends StatefulWidget {
  const ServiceRegistrationPage({super.key});

  @override
  _ServiceRegistrationPageState createState() =>
      _ServiceRegistrationPageState();
}

class _ServiceRegistrationPageState extends State<ServiceRegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  String? selectedServiceType;
  final _serviceTitleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _availabilityController = TextEditingController();
  final _contactNumberController = TextEditingController();

  final List<String> _serviceTypes = [
    'Limpieza de hogar',
    'Plomería',
    'Electricista',
    'Mano de obra',
    'Pintura',
    'Jardinería',
  ];

  @override
  void dispose() {
    _serviceTitleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _availabilityController.dispose();
    _contactNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registra tu servicio'),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                decoration: _inputDecoration('Selecciona el tipo de servicio'),
                items: _serviceTypes
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                onChanged: (value) =>
                    setState(() => selectedServiceType = value),
                validator: (value) => value == null
                    ? 'Por favor selecciona un tipo de servicio'
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _serviceTitleController,
                decoration: _inputDecoration('Nombre del servicio'),
                validator: _requiredValidator,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: _inputDecoration('Descripción del servicio'),
                validator: _requiredValidator,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _priceController,
                decoration: _inputDecoration('Precio por hora'),
                keyboardType: TextInputType.number,
                validator: _requiredValidator,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _availabilityController,
                decoration:
                    _inputDecoration('Disponibilidad (ej., Lun-Vie, 9am-5pm)'),
                validator: _requiredValidator,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _contactNumberController,
                decoration: _inputDecoration('Número de contacto'),
                keyboardType: TextInputType.phone,
                validator: _requiredValidator,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Aquí podrías enviar los datos a un backend o continuar a la siguiente pantalla
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Servicio registrado exitosamente')),
                    );
                  }
                },
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo es requerido';
    }
    return null;
  }
}
