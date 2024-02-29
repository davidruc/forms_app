import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo usuario"),
        centerTitle: true,
      ),
      body:  const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               FlutterLogo(size: 140,),
              _RegisterInput(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterInput extends StatelessWidget {
  const _RegisterInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomInputTextField(
            label: 'Nombre de usuario',
            hint: 'Ingrese su nombre completo',
          ),
          
          const SizedBox(height: 10,),
          CustomInputTextField(
            label: 'Correo electrónico',
            hint: "Ingrese su correo electrónico",
          ),
          
          const SizedBox(height: 10,),
          CustomInputTextField(
            label: 'contraseña',
            hint: 'Ingrese una contraseña segura',
            isPassword: true,
          ),
          const SizedBox(height: 20,),
          FilledButton.tonalIcon(
            onPressed: (){}, 
            icon: const Icon(Icons.create_rounded),
            label: const Text("Crear usuario")
          ),
        ],
      ));
  }
}