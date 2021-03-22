import 'package:flutter/material.dart';
import '../Resources/colors.dart';
import '../pages/scratchcard_page.dart';

import 'cardPayment.dart';
import 'inAppPayment_page.dart';

class SelfServicePage extends StatefulWidget {
  @override
  _SelfServicePageState createState() => _SelfServicePageState();
}

class _SelfServicePageState extends State<SelfServicePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3,
        child: Container(
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    text: "SCRTCH CARD",
                  ),
                  Tab(
                    text: "CARD PAYMENT",
                  ),
                  Tab(
                    text: "IN APP PAYMENT",
                  ),
                ],
                labelColor: ColorsRes.greenColor,
                indicatorColor: ColorsRes.greenColor,
              ),
              Container(
                // constraints: BoxConstraints(maxHeight: size.height * .7),
                height: size.height * .7,
                child: TabBarView(children: [
                  ScratchCardPage(),
                  CardPaymentPage(),
                  InAppPaymentPage(),
                ]),
              )
            ],
          ),
        ));
  }
}
