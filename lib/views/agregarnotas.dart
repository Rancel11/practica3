import 'package:flutter/material.dart';

class AgregarNotasPage extends StatefulWidget {
  final Function(String, String) onSave;

  const AgregarNotasPage({super.key, required this.onSave});

  @override
  State<AgregarNotasPage> createState() => _AgregarNotasPageState();
}

class _AgregarNotasPageState extends State<AgregarNotasPage> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();

  void _guardarNota() {
    String titulo = _tituloController.text.trim();
    String contenido = _contenidoController.text.trim();

    if (titulo.isNotEmpty && contenido.isNotEmpty) {
      widget.onSave(titulo, contenido);
      _tituloController.clear();
      _contenidoController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nota guardada')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Agregar Nota',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _tituloController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Título de la nota',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _contenidoController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Contenido de la nota',
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _guardarNota,
            child: const Text('Guardar Nota'),
          ),
        ],
      ),
    );
  }
}
