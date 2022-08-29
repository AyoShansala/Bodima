import 'package:flutter/material.dart';
import 'package:new_bodima_app/client_view/all_users/all_users_screen.dart';
import 'package:new_bodima_app/client_view/push_notification/all_users.dart';
import 'package:new_bodima_app/client_view/widgets/custon_drawer.dart';

import 'deduction.dart';
import 'payment_screen.dart';

class CustomTabBarController extends StatelessWidget {
  const CustomTabBarController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 241, 241, 241),
          drawer: ClientCustomDrawer(),
          appBar: AppBar(
            toolbarHeight: 65,
            backgroundColor: const Color.fromARGB(255, 3, 53, 4),
            title: const Text("BOARD HOUSE"),
          ),
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [
              AllUsersScreen(),
              Deduction(),
            ],
          ),
        ),
      ),
    );
  }

  menu() {
    return Container(
      color: const Color.fromARGB(255, 3, 53, 4),
      child: const TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.white,
        tabs: [
          Tab(
            text: "Payment",
            icon: Icon(Icons.euro_symbol),
          ),
          Tab(
            text: "Diduction",
            icon: Icon(Icons.assignment),
          ),
        ],
      ),
    );
  }
}
