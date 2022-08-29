import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_bodima_app/client_view/payment_screen.dart';
import 'package:new_bodima_app/user_view/add_user/add_user_screen.dart';

class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({Key? key}) : super(key: key);

  @override
  State<AllUsersScreen> createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<UsersData>>(
        stream: readDashboardUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final allUsers = snapshot.data!;
            return ListView(
              children: allUsers.map(buildUser).toList(),
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
  Widget buildUser(UsersData user) => InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => PaymentScreen(userUid: user.id)),
          );
        },
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
                        user.name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        user.phoneNumber1,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        user.roomNumber,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  //......................................................................................
  Stream<List<UsersData>> readDashboardUser() =>
      FirebaseFirestore.instance.collection("UsersData").snapshots().map(
            (snapshot) => snapshot.docs
                .map(
                  (doc) => UsersData.fromJson(
                    doc.data(),
                  ),
                )
                .toList(),
          );
}
