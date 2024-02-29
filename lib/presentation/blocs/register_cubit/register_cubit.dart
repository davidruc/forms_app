import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());


  void onSubmit(){
    print("submit: $state");
  }
  
  // Definamos métodos para cuando cambie el email, user y password
  void userChanged(String value){
    emit(
      state.copyWith(
        username: value,
      )
    );
  }
  void emailChanged(String value){
    emit(
      state.copyWith(
        email: value,
      )
    );
  } 
  void passwordChanged(String value){
    emit(
      state.copyWith(
        password: value,
      )
    );
  }

}