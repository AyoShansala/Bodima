import 'package:flutter/material.dart';
import 'widgets/card.dart';
import 'widgets/drawer.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: const Color.fromARGB(255, 3, 53, 4),
        title: const Text(
          "BOARD HOUSE",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      drawer: CustomDrawer(),
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  late final maxHeight;
                  if (MediaQuery.of(context).orientation ==
                      Orientation.portrait) {
                    maxHeight = constraints.maxHeight;
                  } else {
                    maxHeight = constraints.maxHeight * 1.5;
                  }
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 25,
                            ),
                            CustomCard(
                              color1: Color.fromARGB(255, 203, 252, 214),
                              color2: Color.fromARGB(255, 15, 156, 50),
                              amount: 'LKR 10,000',
                              month: 'January',
                              status: 'PAID',
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CustomCard(
                              color1: Color.fromARGB(255, 252, 229, 203),
                              color2: Color.fromARGB(255, 219, 141, 39),
                              amount: 'LKR 10,000',
                              month: 'February',
                              status: 'PENDING',
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CustomCard(
                              color1: Color.fromARGB(255, 203, 241, 252),
                              color2: Color.fromARGB(255, 15, 116, 156),
                              amount: 'LKR 10,000',
                              month: 'March',
                              status: 'PAY NOW',
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CustomCard(
                              color1: Color.fromARGB(255, 203, 241, 252),
                              color2: Color.fromARGB(255, 15, 116, 156),
                              amount: 'LKR 10,000',
                              month: 'April',
                              status: 'PAY NOW',
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CustomCard(
                              color1: Color.fromARGB(255, 203, 241, 252),
                              color2: Color.fromARGB(255, 15, 116, 156),
                              amount: 'LKR 10,000',
                              month: 'May',
                              status: 'PAY NOW',
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CustomCard(
                              color1: Color.fromARGB(255, 203, 241, 252),
                              color2: Color.fromARGB(255, 15, 116, 156),
                              amount: 'LKR 10,000',
                              month: 'June',
                              status: 'PAY NOW',
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CustomCard(
                              color1: Color.fromARGB(255, 203, 241, 252),
                              color2: Color.fromARGB(255, 15, 116, 156),
                              amount: 'LKR 10,000',
                              month: 'July',
                              status: 'PAY NOW',
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CustomCard(
                              color1: Color.fromARGB(255, 203, 241, 252),
                              color2: Color.fromARGB(255, 15, 116, 156),
                              amount: 'LKR 10,000',
                              month: 'August',
                              status: 'PAY NOW',
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CustomCard(
                              color1: Color.fromARGB(255, 203, 241, 252),
                              color2: Color.fromARGB(255, 15, 116, 156),
                              amount: 'LKR 10,000',
                              month: 'September',
                              status: 'PAY NOW',
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CustomCard(
                              color1: Color.fromARGB(255, 203, 241, 252),
                              color2: Color.fromARGB(255, 15, 116, 156),
                              amount: 'LKR 10,000',
                              month: 'Octomber',
                              status: 'PAY NOW',
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CustomCard(
                              color1: Color.fromARGB(255, 203, 241, 252),
                              color2: Color.fromARGB(255, 15, 116, 156),
                              amount: 'LKR 10,000',
                              month: 'November',
                              status: 'PAY NOW',
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CustomCard(
                              color1: Color.fromARGB(255, 203, 241, 252),
                              color2: Color.fromARGB(255, 15, 116, 156),
                              amount: 'LKR 10,000',
                              month: 'December',
                              status: 'PAY NOW',
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
