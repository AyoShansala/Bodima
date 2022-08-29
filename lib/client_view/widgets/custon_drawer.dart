import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_bodima_app/client_view/all_users/all_users_screen.dart';
import 'package:new_bodima_app/client_view/push_notification/all_users.dart';

class ClientCustomDrawer extends StatelessWidget {
  const ClientCustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.network(
              'https://post.healthline.com/wp-content/uploads/2020/09/healthy-eating-ingredients-732x549-thumbnail.jpg',
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllUsersData(),
                ),
              );
            },
            leading: Icon(Icons.account_circle),
            title: Text("Send Notification"),
            tileColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
