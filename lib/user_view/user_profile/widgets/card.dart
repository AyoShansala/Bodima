import 'package:flutter/material.dart';
import 'package:new_bodima_app/user_view/payment_screen/payment_screen.dart';

class CustomCard extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String month;
  final String amount;
  final String status;

  const CustomCard({
    Key? key,
    required this.color1,
    required,
    required this.color2,
    required this.amount,
    required this.month,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (c) => PaymentScreen(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    month,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    amount,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // primary: Color.fromARGB(255, 203, 252, 214), // background
                  // onPrimary: Color.fromARGB(255, 15, 156, 50), // foreground
                  primary: color1,
                  onPrimary: color2,
                ),
                onPressed: () {},
                child: Text(
                  status,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 189, 189, 189),
              offset: const Offset(0.7, 0.0),
              blurRadius: 5.0,
              spreadRadius: 2.5,
            )
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 80,
      ),
    );
  }
}
