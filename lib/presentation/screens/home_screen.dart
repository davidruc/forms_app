import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('cubits'),
            subtitle: const Text('Gestor de estado simple'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => {},
          ),
          
          ListTile(
            title: const Text('Flutter_Bloc'),
            subtitle: const Text('Gestor de estado robusto'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}