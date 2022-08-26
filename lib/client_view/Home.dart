// import 'package:flutter/material.dart';



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DefaultTabController(
//         length: 2,
//         child: SafeArea(
//           child: Scaffold(
//             backgroundColor: const Color.fromARGB(255, 241, 241, 241),
//             drawer: Drawer(),
//             appBar: AppBar(
//               toolbarHeight: 65,
//               backgroundColor: const Color.fromARGB(255, 3, 53, 4),
//               title: const Text("BOARD HOUSE"),
//             ),
//             bottomNavigationBar: menu(),
//             body:  TabBarView(
//               children: [
//                 PaymentScreen(),
//                 Deduction(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   menu() {
//     return Container(
//       color: const Color.fromARGB(255, 3, 53, 4),
//       child: const TabBar(
//         labelColor: Colors.white,
//         unselectedLabelColor: Colors.white70,
//         indicatorSize: TabBarIndicatorSize.tab,
//         indicatorPadding: EdgeInsets.all(5.0),
//         indicatorColor: Colors.white,
//         tabs: [
//           Tab(
//             text: "Payment",
//             icon: Icon(Icons.euro_symbol),
//           ),
//           Tab(
//             text: "Diduction",
//             icon: Icon(Icons.assignment),
//           ),
//         ],
//       ),
//     );
//   }
// }
