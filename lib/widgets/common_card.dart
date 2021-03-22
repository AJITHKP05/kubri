import 'package:flutter/material.dart';
import '../Resources/colors.dart';
import '../model/offer.dart';

class CommonCard extends StatelessWidget {
  final Offer offer;
  final bool selected;

  const CommonCard({Key key, this.selected = false, this.offer})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .35,
      height: size.width * .35,
      decoration: BoxDecoration(
          color: selected ? ColorsRes.greenColor : null,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorsRes.greenColor)),
      child: Container(
        child: offer.popular
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Banner(
                    color: selected ? Colors.white : Color(0xFF919BA0),
                    textStyle: selected
                        ? TextStyle(
                            fontSize: 10,
                            color: ColorsRes.greenColor,
                            fontWeight: FontWeight.w600)
                        : TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                    location: BannerLocation.topEnd,
                    message: "POPULAR",
                    child: _child()),
              )
            : _child(),
      ),
    );
  }

  _child() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "\$ ${offer.price}",
              style: TextStyle(
                  color: selected ? Colors.white : ColorsRes.greenColor),
            ),
            Text("${offer.duration}",
                style: TextStyle(
                    color: selected ? Colors.white : ColorsRes.greenColor)),
          ],
        ),
      );
}
