import 'package:flutter/material.dart';
import '../Resources/colors.dart';
import '../model/offer.dart';
import '../widgets/common_card.dart';

class InAppPaymentPage extends StatefulWidget {
  @override
  _InAppPaymentPageState createState() => _InAppPaymentPageState();
}

class _InAppPaymentPageState extends State<InAppPaymentPage> {
  List<Offer> offers = [
    Offer("0.99", "Daily", false),
    Offer("5.99", "Weekly", true),
    Offer("20.99", "Monthly", true),
    Offer("50.99", "Yearly", false)
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: List.generate(
                offers.length,
                (index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                          onTap: () {
                            _onClick(index);
                          },
                          child: CommonCard(
                            offer: offers[index],
                            selected: selectedIndex == index,
                          )),
                    )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20),
          child: Container(
            width: size.width * .5,
            height: 40,
            decoration: BoxDecoration(
                color: ColorsRes.buttonColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: ColorsRes.buttonColor)),
            child: Center(
              child: Text(
                "PAY",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }

  _onClick(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
