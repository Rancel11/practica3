import 'package:flutter/material.dart';
import 'package:practica3/views/Notas.dart';
import 'package:practica3/views/Usuario.dart';
import 'package:practica3/views/agregarnotas.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc de Notas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final LocalStorage storage = LocalStorage('notas_app.json');
  List<Map<String, String>> _notas = [];
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initializeStorage();
  }

  Future<void> _initializeStorage() async {
    await storage.ready;
    setState(() {
      _initialized = true;
    });
    _cargarNotas();
  }

  Future<void> _cargarNotas() async {
    if (!_initialized) return;

    try {
      final dynamic notasData = storage.getItem('notas');
      if (notasData != null) {
        setState(() {
          _notas = List<Map<String, String>>.from((notasData as List)
              .map((item) => Map<String, String>.from(item)));
        });
      } else {
        setState(() {
          _notas = [];
        });
      }
    } catch (e) {
      print('Error loading notes: $e');
      setState(() {
        _notas = [];
      });
    }
  }

  Future<void> _guardarNotas() async {
    if (!_initialized) return;

    try {
      await storage.setItem('notas', _notas);
    } catch (e) {
      print('Error saving notes: $e');
    }
  }

  void _agregarNota(String titulo, String contenido) {
    setState(() {
      _notas.add({"titulo": titulo, "contenido": contenido});
    });
    _guardarNotas();
  }

  void _eliminarNota(int index) {
    setState(() {
      _notas.removeAt(index);
    });
    _guardarNotas();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final List<Widget> pages = [
      NotasPage(notas: _notas, onDelete: _eliminarNota),
      AgregarNotasPage(onSave: _agregarNota),
      Perfil(totalNotas: _notas.length)
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc de Notas'),
      ),
      body: Row(
        children: [
          NavigationRail(
            extended: screenWidth >= 800,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.list, color: Colors.blue),
                selectedIcon: Icon(Icons.list_alt),
                label: Text('Notas'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.add, color: Colors.blue),
                selectedIcon: Icon(Icons.add_box),
                label: Text('Agregar Nota'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person, color: Colors.blue),
                selectedIcon: Icon(Icons.person_outline),
                label: Text('Perfil'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1, color: Colors.grey[300]),
          Expanded(child: pages[_selectedIndex]),
        ],
      ),
    );
  }
}
