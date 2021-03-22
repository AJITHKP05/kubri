import 'package:flutter/material.dart';
import '../Resources/colors.dart';
import '../pages/self_service_page.dart';

import 'agent_page.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedindex = 0;
  List<Widget> list = [AgentPage(), SelfServicePage()];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [customTab(), list[selectedindex]],
    );
  }

  customTab() => Container(
        height: 50,
        child: Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                selectedindex = 0;
                setState(() {});
              },
              child: Container(
                color: selectedindex == 0
                    ? ColorsRes.greenColor
                    : ColorsRes.greyColor,
                child: Center(
                  child: Text(
                    "AGENT",
                    style: TextStyle(
                        color: selectedindex == 0
                            ? Colors.white
                            : ColorsRes.greenColor),
                  ),
                ),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                selectedindex = 1;
                setState(() {});
              },
              child: Container(
                color: selectedindex == 1
                    ? ColorsRes.greenColor
                    : ColorsRes.greyColor,
                child: Center(
                  child: Text(
                    "SELF SERVICE",
                    style: TextStyle(
                        color: selectedindex == 1
                            ? Colors.white
                            : ColorsRes.greenColor),
                  ),
                ),
              ),
            ))
          ],
        ),
      );
}
