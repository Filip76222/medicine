import 'package:flutter/material.dart';
import 'package:myapp/Comm/genToast.dart';

//ignore: must_be_immutable
class genTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  IconData icon;
  bool isObscureText;
  TextInputType inputType;
  bool isEnable;

  genTextFormField(
      {required this.controller,
      required this.hintName,
      required this.icon,
      this.isObscureText = false,
      this.inputType = TextInputType.text,
      this.isEnable = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        keyboardType: inputType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Prosze Wprowadzić $hintName';
          }
          if (hintName == "Adres Email" && !validateEmail(value)) {
            return 'Proszę Wprowadzić Poprawny Adres Email';
          }
          return null;
        },
        //validator: (String? val) {
        //  if (val != null && val.isEmpty) {
        //    return "Proszę uzupełnić $hintName";
        //  }
        //   return null;
        // },
        //onSaved: (val) => controller.text = val,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.black),
          ),
          prefixIcon: Icon(icon),
          hintText: hintName,
          labelText: hintName,
          fillColor: Colors.black12,
          filled: true,
        ),
      ),
    );
  }
}
