import 'package:flutter/material.dart';

class CustomInputTextField extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChange;
  final bool isPassword;
  final String? Function(String?)? validator;
  const CustomInputTextField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.onChange, 
    this.validator, 
    this.isPassword = false
    });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      // borderSide: BorderSide(color: colors.primary)
    );

    return TextFormField(
      onChanged: onChange,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration( 
        enabledBorder: border,
        focusedBorder: border.copyWith( borderSide: BorderSide( color: colors.primary ) ),

        label: label != null ? Text(label!) : null,
        isDense: true,
        hintText: hint,
        focusColor: colors.primary,
        // icon: Icon(Icons.supervised_user_circle_rounded, color: colors.primary),
        // suffixIcon: Icon(Icons.supervised_user_circle_rounded, color: colors.primary),
        prefixIcon: Icon(Icons.supervised_user_circle_rounded, color: colors.primary),
        
        focusedErrorBorder: border.copyWith( borderSide: BorderSide( color: Colors.red.shade800 ) ),
        errorBorder: border.copyWith( borderSide: BorderSide( color: Colors.red.shade800 ) ),
        errorText: errorMessage,
     
       ),
      
    );
  }
}