import 'package:flutter/material.dart';

class BordButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  const BordButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: OutlinedButton(
            child: Text(text),
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.green,
              // onSurface: Colors.orangeAccent,

              minimumSize: Size(MediaQuery.of(context).size.width - 60, 40),
            ),
            onPressed: press
            //conditionCheck();
            //loginWithPhone();
            // print("####button clicked*****");
            // Future.delayed(
            //   Duration(seconds: 20),
            //   () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => VerificationScreen(
            //           verified: verificationIdNumber,
            //           userPhoneNum: mobileNumberController.text,
            //         ),
            //       ),
            //     );
            //   },
            // );

            ),
      ),
    );
  }
}
