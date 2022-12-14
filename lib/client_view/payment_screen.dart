import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../user_view/payment_screen/payment_screen.dart';

class PaymentScreen extends StatefulWidget {
  final String userUid;
  const PaymentScreen({
    super.key,
    required this.userUid,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    //double ScreenHeight = (MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: StreamBuilder<List<PaymentData>>(
        stream: readDashboardUser(widget.userUid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final allUsers = snapshot.data;
            return ListView(
              children: allUsers!.map(buildUser).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  //......................Methods.........................................................
  Widget buildUser(PaymentData user) => InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.height * 0.90,
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
                        user.id,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        user.paymentStatus,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(
                          255, 203, 252, 214), // background
                      onPrimary:
                          const Color.fromARGB(255, 15, 156, 50), // foreground
                    ),
                    onPressed: () {},
                    child: const Text(
                      'APPROVE',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  //......................................................................................
  Stream<List<PaymentData>> readDashboardUser(String userUniqId) =>
      FirebaseFirestore.instance
          .collection("PaymentData")
          .doc(userUniqId)
          .collection("Months")
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map(
                  (doc) => PaymentData.fromJson(
                    doc.data(),
                  ),
                )
                .toList(),
          );
}
