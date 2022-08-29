import 'package:flutter/cupertino.dart';

class Deduction extends StatelessWidget {
  const Deduction({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = (MediaQuery.of(context).size.height);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              late final maxHeight;
              if (MediaQuery.of(context).orientation == Orientation.portrait) {
                maxHeight = constraints.maxHeight;
              } else {
                maxHeight = constraints.maxHeight * 1.5;
              }
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: ScreenHeight,
                  ),
                  child: Column(
                      // children: [
                      //   const SizedBox(
                      //     height: 25,
                      //   ),
                      //   PaymentTab(
                      //       data2: ' 10,000', onPressed: () {}, data1: 'January'),
                      //   const SizedBox(
                      //     height: 25,
                      //   ),
                      //   PaymentTab(
                      //       data2: ' 10,000',
                      //       onPressed: () {},
                      //       data1: 'February'),
                      //   const SizedBox(
                      //     height: 25,
                      //   ),
                      //   PaymentTab(
                      //       data2: ' 10,000', onPressed: () {}, data1: 'March'),
                      // ],
                      ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
