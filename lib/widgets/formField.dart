import 'package:flutter/material.dart';

// to make text form field to reuse it

formField({
  required TextEditingController controller,
  required String labelText,
  String? hentText,
  required Icon prefixicon,
  IconData? suffixicon,
  suffixpressed,
  bool? obscureText,
  required TextInputType keyboardtype,
  String? validiationMesseage,
  TextInputAction? text_input_action,
  onsubmit(value)?,
}) {
  return TextFormField(
    obscureText: obscureText ?? false,
    controller: controller,
    // to make action when click on keyboard submit
    textInputAction: text_input_action,

    decoration: InputDecoration(
      // text appear in box and when you pressed on it move to up and donot disappear
      labelText: labelText,
      // word appear when presed on box and disappeared when user write
      hintText: hentText,
      // to put icon in the start of box
      prefixIcon: prefixicon,
      prefixIconColor: Colors.blue[400],
      suffixIcon: IconButton(onPressed: suffixpressed, icon: Icon(suffixicon)),
      suffixIconColor: Colors.blue[400],

      // use to put TextFormField inside box
      border: const OutlineInputBorder(),
    ),
    keyboardType: keyboardtype,
    onFieldSubmitted: onsubmit,
    // make validator to check empty
    validator: (String? value) {
      if (value!.isEmpty) {
        return validiationMesseage;
      }
      return null;
    },
  );
}
