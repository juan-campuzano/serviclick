import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Buscar servicio',
        prefixIcon: Icon(Icons.search),
      ),
      cursorColor: Theme.of(context).colorScheme.primary,
      onChanged: (value) {},
    );
  }
}
