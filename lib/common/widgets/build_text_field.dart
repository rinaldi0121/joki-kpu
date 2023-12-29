import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    super.key,
    required this.context,
    this.controller,
    required this.placeHolder,
    required this.func,
  });

  final BuildContext context;
  final TextEditingController? controller;
  final String placeHolder;
  final void Function(String value)? func;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7, bottom: 7, left: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: (value) => func!(value),
        keyboardType: placeHolder == "Masukkan Nomor KTP" ||
                placeHolder == "Masukkan Nomor Telepon"
            ? TextInputType.number
            : TextInputType.emailAddress,
        obscureText: placeHolder == "Masukkan Password" ||
                placeHolder == "Konfirmasi Password"
            ? true
            : false,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontSize: 15,
          ),
          contentPadding: EdgeInsets.only(
            left: 20,
            top: placeHolder == "Masukkan Saran" ? 10 : 0,
          ),
          hintText: placeHolder,
          border: InputBorder.none,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: placeHolder == "Masukkan Saran" ? 6 : 1,
      ),
    );
  }
}
