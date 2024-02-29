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
  const _RegisterView();

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

class _RegisterInput extends StatefulWidget {
  const _RegisterInput();

  @override
  State<_RegisterInput> createState() => _RegisterInputState();
}

class _RegisterInputState extends State<_RegisterInput> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomInputTextField(
            label: 'Nombre de usuario',
            hint: 'Ingrese su nombre completo',
            onChange: (value) => username = value,
            validator: (value) {
              if ( value == null || value.isEmpty || value.trim().isEmpty) return 'este campo es requerido';
              if (value.length < 6) return 'El usuario debe tener más de 6 letras';
              return null;
            },
          ),
          
          const SizedBox(height: 10,),
          CustomInputTextField(
            label: 'Correo electrónico',
            hint: "Ingrese su correo electrónico",
            onChange: (value) => email = value,
            validator: (value) {
              if ( value == null || value.isEmpty || value.trim().isEmpty) return 'este campo es requerido';
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$' 
              );
              if (!emailRegExp.hasMatch(value)) return 'Correo electrónico no válido';
              return null;
            },
          ),
          
          const SizedBox(height: 10,),
          CustomInputTextField(
            label: 'contraseña',
            hint: 'Ingrese una contraseña segura',
            isPassword: true,
            onChange: (value) => password = value,
            validator: (value) {
              if ( value == null || value.isEmpty || value.trim().isEmpty) return 'este campo es requerido';
              if (value.length < 6) return 'La contraseña debe contener almenos de 6 caractes';
              return null;
            },    
          ),
          const SizedBox(height: 20,),
          FilledButton.tonalIcon(
            onPressed: (){

              final bool isValid = _formKey.currentState!.validate();
              if(!isValid) return;
              
              // Aquí iría envio http de la data
              print('$username, $email, $password');
            }, 
            icon: const Icon(Icons.create_rounded),
            label: const Text("Crear usuario"),
          ),
        ],
      ));
  }
}