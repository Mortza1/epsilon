import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/memberBox.dart';
import '../models/app_state-manager.dart';
class Team extends StatefulWidget {
  const Team({
    Key? key,
  }) : super(key: key);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  late Future data;

  @override
  Widget build(BuildContext context) {
      final AppStateManager myProvider = Provider.of<AppStateManager>(context);
      setState(() {
        data = myProvider.teamData();
      });
    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
          var hello = snapshot.data as Map<String, dynamic>;
          var members = hello["members"];
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Color(0xff361553),
                                size: 30,
                              )),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Text(
                            "Team",
                            style: TextStyle(
                                color: Color(0xff361553),
                                fontSize: 30,
                                fontFamily: "Syne",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                          child: Container(
                              height: 165,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(10, 8, 10, 0),
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: const [
                                          Icon(
                                            Icons.account_circle,
                                            size: 50,
                                            color: Color(0xff361553),
                                          ),
                                          Text(
                                            "Head Delegate",
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
                                              members[0]["name"],
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
                                              members[0]["institution"],
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
                        ),
                        for (var i = 1; i < members.length; i++)
                          memberBox(
                            name: members[i]["name"],
                            institution: members[i]["institution"],
                          )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                )),
          );
        }
      },
    );
  }
}
