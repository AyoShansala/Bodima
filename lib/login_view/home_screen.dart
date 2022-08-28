import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_bodima_app/login_view/widgets/custom_textfield.dart';

import 'widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.network(
                  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/landscaping-ideas-hbx060117bartholomew13-1654206150.jpg?crop=0.869xw:1.00xh;0.0969xw,0&resize=980:*'),
            ),
            Positioned(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      color: Colors.white.withOpacity(1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BordTextField(
                                type: TextInputType.number,
                                hintText: "Enter Phone Number",
                                textEditingController: phoneNumberController,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BordButton(
                                text: "Get OTP",
                                press: () {
                                  //send phone number to otp screen
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (c) => OTPScreen(
                                  //       phone: phoneNumberController.text,
                                  //     ),
                                  //   ),
                                  // );
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              top: MediaQuery.of(context).size.width,
              left: 0,
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      ),
    );
  }
}
