import 'package:flutter/material.dart';
import '../Resources/colors.dart';
import '../model/offer.dart';
import '../widgets/common_card.dart';

class AgentPage extends StatefulWidget {
  @override
  _AgentPageState createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  List<Offer> offers = [
    Offer("0.99", "Daily", false),
    Offer("5.99", "Weekly", false),
    Offer("20.99", "Monthly", false),
    Offer("50.99", "Yearly", false)
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.width * .1,
          ),
          SizedBox(
              height: size.width * .3,
              width: size.width * .3,
              child: CircleAvatar(
                minRadius: 5,
                backgroundImage: AssetImage("assets/icons/sara.png"),
              )),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "SARA",
              style: TextStyle(
                  color: ColorsRes.greenColor, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            "+971 765 867 678",
            style: TextStyle(color: ColorsRes.greenColor),
          ),
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
                  "Recharge",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _onClick(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
