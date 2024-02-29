import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
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
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView()),
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

class _RegisterInput extends StatelessWidget {
  const _RegisterInput();

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
      // key: _formKey,
      child: Column(
        children: [
          CustomInputTextField(
            label: 'Nombre de usuario',
            hint: 'Ingrese su nombre completo',
            onChange: registerCubit.userChanged,
            errorMessage: username.errorMessage,
          ),
          
          const SizedBox(height: 10,),
          CustomInputTextField(
            label: 'Correo electrónico',
            hint: "Ingrese su correo electrónico",
            onChange: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
          ),
          
          const SizedBox(height: 10,),
          CustomInputTextField(
            label: 'contraseña',
            hint: 'Ingrese una contraseña segura',
            isPassword: true,
            onChange: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
           
          ),
          const SizedBox(height: 20,),
          FilledButton.tonalIcon(
            onPressed: (){
              // final bool isValid = _formKey.currentState!.validate();
              // if(!isValid) return;
              
              // Aquí iría envio http de la data

               registerCubit.onSubmit(); 
            }, 
            icon: const Icon(Icons.create_rounded),
            label: const Text("Crear usuario"),
          ),
        ],
      ));
  }
}