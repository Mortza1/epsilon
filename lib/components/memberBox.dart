import 'package:flutter/material.dart';

class memberBox extends StatelessWidget {
  final String name;
  final String institution;

  const memberBox({
    Key? key,
    required this.name,
    required this.institution,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: Container(
          height: 165,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.account_circle,
                        size: 50,
                        color: Color(0xff361553),
                      ),
                      Text(
                        "Member",
                        style: TextStyle(
                            color: Color(0xff361553),
                            fontSize: 25,
                            fontFamily: "Syne",
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Name:",
                          style: TextStyle(
                              color: Color(0xff361553),
                              fontSize: 20,
                              fontFamily: "Syne"),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                              color: Color(0xffaf52e0),
                              fontSize: 20,
                              fontFamily: "Syne"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Institution:",
                          style: TextStyle(
                              color: Color(0xff361553),
                              fontSize: 20,
                              fontFamily: "Syne"),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          institution,
                          style: const TextStyle(
                              color: Color(0xffaf52e0),
                              fontSize: 20,
                              fontFamily: "Syne"),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}