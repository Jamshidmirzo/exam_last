import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputWidget extends StatelessWidget {
  final String title;
  final TextEditingController controler;
  String? Function(String?)? validator;
  InputWidget(
      {super.key,
      required this.controler,
      required this.title,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controler,
          validator: validator,
          decoration: InputDecoration(
            focusColor: Colors.blue,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
