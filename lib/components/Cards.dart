import 'package:epsilonv7/data/constants.dart';
import 'package:epsilonv7/screens/herofile.dart';
import 'package:flutter/material.dart';

class FrontCard extends StatelessWidget {
  final int index;

  const FrontCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Herocard(
                num: index,
              ))),
      child: Material(
        elevation: 5,
        shadowColor: const Color(0xff1d8a99),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Hero(
          tag: "demon",
          child: Container(
            height: 120,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(images[index]), fit: BoxFit.cover),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
          ),
        ),
      ),
    );
  }
}
