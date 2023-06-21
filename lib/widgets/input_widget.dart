import 'package:flutter/material.dart';

import '../bloc/final_tes_bloc.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.state,
  });

  final FinalTesStateInitial state;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validasi input,ketika input bernilai null akan memunculkan pop up messege
      validator: (number) {
        if (number == null || number.isEmpty) {
          return 'Mohon Masukkan Angka';
        }

        return null;
      },
      controller: state.numberController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xffD4D4D4))),
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        contentPadding: const EdgeInsets.all(12),
        hintText: 'Silahkan Input Nomor',
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(
            0xffA3A3A3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xffD4D4D4))),
      ),
    );
  }
}
