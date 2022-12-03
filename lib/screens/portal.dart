import 'package:epsilonv7/screens/paymentPage.dart';
import 'package:epsilonv7/screens/teamPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state-manager.dart';
import '../models/epsilonPages.dart';
import 'modulePage.dart';

class Portal extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: EpsilonPages.home,
        key: ValueKey(EpsilonPages.home),
        child: const Portal());
  }

  const Portal({Key? key}) : super(key: key);

  @override
  State<Portal> createState() => _PortalState();
}

class _PortalState extends State<Portal> {
  late Future data;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  //final GlobalKey<ScaffoldState> _key = GlobalKey();

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
          if (kDebugMode) {
            print(hello);
          }
          return PortalScreen(team: hello["name"]);
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

class PortalScreen extends StatelessWidget {
  final String team;

  const PortalScreen({Key? key, required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppStateManager myProvider = Provider.of<AppStateManager>(context);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
          child: MaterialButton(
            onPressed: () {
              myProvider.logout(context);
            },
            height: 50,
            minWidth: MediaQuery.of(context).size.width * 0.85,
            color: const Color(0xff361553),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: const Text(
              "Logout",
              style: TextStyle(
                  fontFamily: "Syne",
                  fontWeight: FontWeight.bold,
                  color: Color(0xffffffff),
                  fontSize: 20),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.account_circle,
                          size: 50,
                          color: Color(0xff361553),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome back",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Syne",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            Text(
                              "Team $team",
                              style: const TextStyle(
                                  color: Color(0xffaf52e0),
                                  fontFamily: "Syne",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Material(
                    elevation: 10,
                    borderRadius:
                    const BorderRadius.all(Radius.circular(10)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Team()),
                        );
                      },
                      child: Ink(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade300,
                        ),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.group,
                                size: 50,
                                color: Color(0xff361553),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "Team",
                              style: TextStyle(
                                  color: Color(0xffaf52e0),
                                  fontSize: 25,
                                  fontFamily: "Syne",
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Material(
                    elevation: 10,
                    borderRadius:
                    const BorderRadius.all(Radius.circular(10)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ModulesPortal()),
                        );
                      },
                      child: Ink(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade300,
                        ),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.view_module,
                                size: 50,
                                color: Color(0xff361553),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ), Text(
                              "Modules",
                              style: TextStyle(
                                  color: Color(0xffaf52e0),
                                  fontSize: 25,
                                  fontFamily: "Syne",
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Material(
                    elevation: 10,
                    borderRadius:
                    const BorderRadius.all(Radius.circular(10)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentPage()),
                        );
                      },
                      child: Ink(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade300,
                        ),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.wallet,
                                size: 50,
                                color: Color(0xff361553),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "Payment",
                              style: TextStyle(
                                  color: Color(0xffaf52e0),
                                  fontSize: 25,
                                  fontFamily: "Syne",
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



