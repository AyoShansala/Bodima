import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:new_bodima_app/user_view/user_profile/user_profile_screen.dart';

import '../../login_view/widgets/custom_button.dart';
import '../../login_view/widgets/custom_textfield.dart';

class AddUserScreen extends StatefulWidget {
  AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final TextEditingController _nameTxtController = TextEditingController();

  final TextEditingController _addressTxtController = TextEditingController();

  final TextEditingController _roomNumTxtController = TextEditingController();

  final TextEditingController _phoneNumTxtController = TextEditingController();

  final TextEditingController _secondPhoneNumTxtController =
      TextEditingController();

  final TextEditingController _idNumTxtController = TextEditingController();
  late String? mtoken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: const IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: null,
        ),
        title: const Text("Add User Data"), // Title............
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: const Color(0xffeeeeee),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    BordTextField(
                      type: TextInputType.text,
                      hintText: "Name",
                      textEditingController: _nameTxtController,
                    ),
                    const SizedBox(height: 20),
                    BordTextField(
                      type: TextInputType.text,
                      hintText: "Address",
                      textEditingController: _addressTxtController,
                    ),
                    const SizedBox(height: 20),
                    BordTextField(
                      type: TextInputType.number,
                      hintText: "Room Number",
                      textEditingController: _roomNumTxtController,
                    ),
                    const SizedBox(height: 20),
                    BordTextField(
                      type: TextInputType.number,
                      hintText: "Parent Phone Number",
                      textEditingController: _phoneNumTxtController,
                    ),
                    const SizedBox(height: 20),
                    BordTextField(
                      type: TextInputType.number,
                      hintText: "Parent Phone Number",
                      textEditingController: _secondPhoneNumTxtController,
                    ),
                    const SizedBox(height: 20),
                    BordTextField(
                      type: TextInputType.text,
                      hintText: "ID Number",
                      textEditingController: _idNumTxtController,
                    ),
                    const SizedBox(height: 20),
                    BordButton(
                        text: "Submit",
                        press: () async {
                          FirebaseMessaging.instance.getToken().then((token) {
                            setState(() {
                              mtoken = token;
                            });
                          });
                          //add user data
                          final userTest = UsersData(
                            name: _nameTxtController.text,
                            address: _addressTxtController.text,
                            roomNumber: _roomNumTxtController.text,
                            phoneNumber1: _phoneNumTxtController.text,
                            phoneNumber2: _secondPhoneNumTxtController.text,
                            idNumber: _idNumTxtController.text,
                            pushIdToken: mtoken!,
                          );
                          createUser(userTest);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserProfileScreen(),
                            ),
                          );
                        }),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future createUser(UsersData user) async {
    //reference to document
    final docUser = FirebaseFirestore.instance
        .collection("UsersData")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    user.id = docUser.id;
    final json = user.toJson();

    //create document and write data to firebase
    await docUser.set(json);
  }
}

//.......user_data_model.................................
class UsersData {
  String id;
  final String name;
  final String address;
  final String roomNumber;
  final String phoneNumber1;
  final String phoneNumber2;
  final String idNumber;
  final String pushIdToken;
  UsersData({
    this.id = '',
    required this.name,
    required this.address,
    required this.roomNumber,
    required this.phoneNumber1,
    required this.phoneNumber2,
    required this.idNumber,
    required this.pushIdToken,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'Name': name,
        'Address': address,
        'Room_Number': roomNumber,
        'Phone_Number1': phoneNumber1,
        'Phone_Number2': phoneNumber2,
        'ID_Number': idNumber,
        'Push_notifi_id': pushIdToken,
      };

  static UsersData fromJson(Map<String, dynamic> json) => UsersData(
        id: json['id'].toString(),
        name: json['Name'].toString(),
        address: json['Address'].toString(),
        roomNumber: json['Room_Number'].toString(),
        phoneNumber1: json['Phone_Number1'].toString(),
        phoneNumber2: json['Phone_Nummber2'].toString(),
        idNumber: json['ID_Number'].toString(),
        pushIdToken: json['Push_notifi_id'].toString(),
      );
}
