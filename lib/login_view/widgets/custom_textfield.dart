import 'package:flutter/material.dart';

class BordTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType type;
  const BordTextField(
      {Key? key,
      required this.hintText,
      required this.textEditingController,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      child: TextField(
        controller: textEditingController,
        keyboardType: type,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: hintText,
          labelStyle: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
