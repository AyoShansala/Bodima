import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const MyApp(),
              //   ),
              // );
            },
            leading: Icon(Icons.account_circle),
            title: Text("Fran Jack Aranda"),
            tileColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
          ),
          ListTile(
            leading: Icon(Icons.house),
            title: Text("Board House: "),
            tileColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
          ),
          ListTile(
            leading: Icon(Icons.numbers_rounded),
            title: Text("Room Number: "),
            tileColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
          )
        ],
      ),
    );
  }
}
