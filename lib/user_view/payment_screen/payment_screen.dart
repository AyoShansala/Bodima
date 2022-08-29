import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);

  final TextEditingController _yearMonthTxtController = TextEditingController();
  final TextEditingController _statusTxtController = TextEditingController();
  final String amountOfPay = "LKR 10,000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "10,000LKR",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _yearMonthTxtController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    labelText: "Year/Month",
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    hintText: "Your Message",
                    hintStyle: TextStyle(color: Colors.white30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        new Radius.circular(5.0),
                      ),
                    ),
                    labelStyle: TextStyle(color: Colors.white)),
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      //side: BorderSide(width: 2, color: Colors.black),
                      primary: Color.fromARGB(255, 207, 233, 255),
                      elevation: 0, // background
                      onPrimary: Color.fromARGB(255, 26, 88, 139),
                      padding: EdgeInsets.all(25) // foreground
                      ),
                  onPressed: () async {
                    // final result = await FilePicker.platform.pickFiles();
                    // if (result == null) return;

                    // final file = result.files.first;
                    // openFile(file);
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.upload_file,
                          size: 30,
                          color: Color.fromARGB(255, 26, 88, 139),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Click here attach your SLIP',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text("Your Message (Optional)")),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 400,
                child: TextFormField(
                  controller: _statusTxtController,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    hintText: "Your Message",
                    hintStyle: TextStyle(color: Colors.white30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        new Radius.circular(5.0),
                      ),
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 10, bottom: 10),
                  primary: const Color.fromARGB(255, 11, 65, 87), // background
                  onPrimary:
                      const Color.fromARGB(255, 243, 250, 255), // foreground
                ),
                onPressed: () {
                  final payMonthyear = _yearMonthTxtController.text;
                  final payData = PaymentData(
                    userNumber: FirebaseAuth.instance.currentUser!.uid,
                    yearMonth: _yearMonthTxtController.text,
                    paymentStatus: _statusTxtController.text,
                    amountOfpayment: amountOfPay,
                  );
                  createUserPayment(
                    payData,
                    FirebaseAuth.instance.currentUser!.uid,
                    payMonthyear,
                  );
                },
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createUserPayment(
      PaymentData user, String userId, String month) async {
    //reference to payment document
    final docUser = FirebaseFirestore.instance
        .collection("PaymentData")
        .doc(userId)
        .collection("Months")
        .doc(month);
    user.id = docUser.id;
    final json = user.toJson();

    //create document and write data to firebase
    await docUser.set(json);
  }
}

//.......payment_data_model.................................
class PaymentData {
  String id;
  final String userNumber;
  final String yearMonth;

  final String paymentStatus;
  final String amountOfpayment;
  PaymentData({
    this.id = '',
    required this.userNumber,
    required this.yearMonth,
    required this.paymentStatus,
    required this.amountOfpayment,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'User_unique_id': userNumber,
        'Year': yearMonth,
        'Payment_Status': paymentStatus,
        'Amount_Of_Payment': amountOfpayment,
      };

  static PaymentData fromJson(Map<String, dynamic> json) => PaymentData(
        id: json['id'].toString(),
        userNumber: json['User_Phone_Number'].toString(),
        yearMonth: json['Year'].toString(),
        paymentStatus: json['Payment_Status'].toString(),
        amountOfpayment: json['Amount_Of_Payment'].toString(),
      );
}
