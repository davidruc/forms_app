import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            onTap: () => context.push("/cubits"),
          ),
          
          ListTile(
            title: const Text('Flutter_Bloc'),
            subtitle: const Text('Gestor de estado compuesto'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push("/blocs"),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          ListTile(
            title: const Text('New user formularie'),
            subtitle: const Text('Manejo de formularios'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push("/login"),
          ),
        ],
      ),
    );
  }
}