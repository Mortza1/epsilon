import 'package:flutter/material.dart';
import '../data/constants.dart';

class Herocard extends StatelessWidget {
  final int num;

  const Herocard({
    Key? key,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
            body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Hero(
                tag: num.toString(),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Material(
                    elevation: 20,
                    shadowColor: const Color(0xff361553),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(imagesHero[num]), fit: BoxFit.cover),
                        borderRadius: const BorderRadius.all(Radius.circular(30))
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 8, 0),
              child: IconButton(
                  onPressed: () {
                    Navigator.popUntil(
                        context, ModalRoute.withName('/landing'));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xffffffff),
                    size: 30,
                  )),
            ),
          ]),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  modDetails[num],
                  style: const TextStyle(
                    fontFamily: 'Syne',
                    color: Color(0xff361553),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    )));
  }
}

