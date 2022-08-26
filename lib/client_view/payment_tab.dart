import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaymentTab extends StatelessWidget {
  String data1;
  String data2;
  VoidCallback onPressed;
  PaymentTab({
    super.key,
    required this.data2,
    required this.onPressed,
    required this.data1,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    double ScreenWidth = (MediaQuery.of(context).size.width);
    return Container(
      width: ScreenWidth * 0.90,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 189, 189, 189),
              offset: Offset(0.7, 0.0),
              blurRadius: 5.0,
              spreadRadius: 2.5,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data1,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "LKR$data2",
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 203, 252, 214), // background
                onPrimary: const Color.fromARGB(255, 15, 156, 50), // foreground
              ),
              onPressed: onPressed,
              child: const Text(
                'APPROVE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
