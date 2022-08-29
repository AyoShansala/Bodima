import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_bodima_app/client_view/push_notification/notification.dart';

import 'package:new_bodima_app/user_view/add_user/add_user_screen.dart';

class AllUsersData extends StatefulWidget {
  const AllUsersData({Key? key}) : super(key: key);

  @override
  State<AllUsersData> createState() => _AllUsersDataState();
}

class _AllUsersDataState extends State<AllUsersData> {
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
              builder: (context) => MainScreen(
                msgToken: user.pushIdToken,
              ),
            ),
          );
        },
        child: ListTile(
          leading: CircleAvatar(
            child: Text(
              '${user.roomNumber}',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.green,
          ),
          title: Text(
            user.name,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            user.idNumber,
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
