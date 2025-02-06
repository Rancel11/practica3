import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  final int totalNotas;

  const Perfil({super.key, required this.totalNotas});

  Widget _buildEstadistica(String titulo, String valor) {
    return Column(
      children: [
        Text(
          valor,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          titulo,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icono) {
    return Icon(icono, size: 30, color: Colors.grey[700]);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue[100],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      size: 50,
                    ),
                  ),
                ),
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Rancel Cedeño',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Desarrollador Flutter',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 20,
                ),
                const SizedBox(width: 5),
                const Text(
                  '45',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                Chip(
                    label: const Text('Flutter'),
                    backgroundColor: Colors.blue[50]),
                Chip(
                    label: const Text('Dart'),
                    backgroundColor: Colors.blue[50]),
                Chip(
                    label: const Text('Firebase'),
                    backgroundColor: Colors.blue[50]),
                Chip(
                    label: const Text('Git'), backgroundColor: Colors.blue[50]),
                Chip(
                    label: const Text('UI/UX'),
                    backgroundColor: Colors.blue[50]),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIcon(Icons.facebook),
                const SizedBox(width: 10),
                _buildIcon(Icons.flight),
                const SizedBox(width: 10),
                _buildIcon(Icons.camera_alt),
                const SizedBox(width: 10),
                _buildIcon(Icons.business),
                const SizedBox(width: 10),
                _buildIcon(Icons.code),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.mail),
                  label: const Text('Contactar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 7, 132, 234),
                    iconColor: Colors.white,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text('CV'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 11, 130, 227),
                    iconColor: Colors.white,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildEstadistica('Proyectos', '20'),
                _buildEstadistica('Seguidores', '3K'),
                _buildEstadistica('Rating', '4.9'),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                Icon(Icons.note, color: Colors.blue),
                Text(
                  ' $totalNotas',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
