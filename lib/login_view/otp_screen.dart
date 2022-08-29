import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:new_bodima_app/login_view/widgets/custom_button.dart';

import '../user_view/add_user/add_user_screen.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var otpNumber;
  String? verificationCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyPhoneNumber();
  }

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+94" + widget.phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) {
            if (value.user != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (c) => AddUserScreen(),
                ),
              );
            }
          },
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message.toString()),
            duration: Duration(
              seconds: 3,
            ),
          ),
        );
      },
      codeSent: (String vID, int? resendToken) {
        setState(() {
          verificationCode = vID;
        });
      },
      codeAutoRetrievalTimeout: (String vID) {
        setState(() {
          verificationCode = vID;
        });
      },
      timeout: Duration(seconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Image.network(
                      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/landscaping-ideas-hbx060117bartholomew13-1654206150.jpg?crop=0.869xw:1.00xh;0.0969xw,0&resize=980:*'),
                  Container(
                    color: Colors.green.withOpacity(0.6),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 25,
                      left: MediaQuery.of(context).size.width / 3,
                      right: MediaQuery.of(context).size.width / 3,
                      child: Image.asset(
                        'lib/assets/Vector.png',
                        width: MediaQuery.of(context).size.width / 2,
                      )),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2.5,
                    bottom: MediaQuery.of(context).size.height / 2.5,
                    left: MediaQuery.of(context).size.width / 6,
                    right: MediaQuery.of(context).size.width / 6,
                    child: const Text(
                      "please enter your OTP code\nto your phone number ",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
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
                              Container(
                                width: MediaQuery.of(context).size.width - 50,
                                child: OtpTextField(
                                  numberOfFields: 6,
                                  borderColor: const Color(0xFF000000),
                                  showFieldAsBox: true,
                                  onSubmit: (String verificationCode) {
                                    otpNumber = verificationCode;
                                  },
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('did not receive the code?',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  )),
                              TextButton(
                                  onPressed: () {}, child: Text('Resend Code'))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BordButton(
                                text: "Verify OTP",
                                press: () async {
                                  //Verifying enterd otp number
                                  try {
                                    await FirebaseAuth.instance
                                        .signInWithCredential(
                                      PhoneAuthProvider.credential(
                                        verificationId: verificationCode!,
                                        smsCode: otpNumber,
                                      ),
                                    )
                                        .then(
                                      (value) {
                                        if (value.user != null) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (c) => AddUserScreen(),
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  } catch (e) {
                                    FocusScope.of(context).unfocus();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Invalid OTP"),
                                        duration: Duration(
                                          seconds: 3,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              )
                            ],
                          ),
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
