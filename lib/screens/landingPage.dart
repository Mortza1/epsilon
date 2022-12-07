import 'package:epsilonv7/components/Cards.dart';
import 'package:epsilonv7/screens/loginScreen.dart';
import 'package:epsilonv7/screens/registerPageUpdate.dart';
import '../models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_mail_app/open_mail_app.dart';

class LandingPage extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: EpsilonPages.landingPage,
        key: ValueKey(EpsilonPages.landingPage),
        child: const LandingPage());
  }

  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).landApp();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AppStateManager>(context, listen: false).barData();
    });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      key: _key,
      drawer: const Drawer(),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      iconSize: 30,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Color(0xff361553),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 12, 8),
                  child: Row(
                    children: [
                      IconButton(
                          iconSize: 30,
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: "Login to get updates",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.deepPurpleAccent,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          icon: const Icon(
                            Icons.notifications_outlined,
                            color: Color(0xff361553),
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          iconSize: 30,
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: "Login or Create an account first",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.deepPurpleAccent,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          icon: const Icon(
                            Icons.account_circle,
                            color: Color(0xff361553),
                          ))
                    ],
                  ),
                )
              ],
            ),
            Flexible(
              flex: 10,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                      child: Container(
                        height: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              image: AssetImage('assets/landinglogo.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 410,
                        child: ContainedTabBarView(
                          tabs: const [
                            Text('Modules'),
                            Text('Fees'),
                            Text('Dates'),
                            Text('Contact'),
                          ],
                          tabBarProperties: TabBarProperties(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 8.0,
                              ),
                              indicator: ContainerTabIndicator(
                                  radius: BorderRadius.circular(16.0),
                                  color: const Color(0xff361553),
                                  borderWidth: 1,
                                  borderColor: const Color(0xff330f47)),
                              indicatorColor: Colors.yellow,
                              labelColor: const Color(0xffffffff),
                              unselectedLabelColor: const Color(0xffae52e0),
                              labelStyle: const TextStyle(
                                  fontFamily: "Syne",
                                  fontWeight: FontWeight.bold)),
                          views: [
                            const ModuleBox(),
                            Fees(),
                            const Dates(),
                            const Contact()
                          ],
                          onChange: (index) => print(index),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );
                          },
                          height: 50,
                          minWidth: MediaQuery.of(context).size.width * 0.9,
                          color: const Color(0xff361553),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                fontFamily: "Syne",
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffffff),
                                fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          height: 50,
                          minWidth: MediaQuery.of(context).size.width * 0.9,
                          color: const Color(0xff361553),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontFamily: "Syne",
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModuleBox extends StatefulWidget {
  const ModuleBox({Key? key}) : super(key: key);

  @override
  State<ModuleBox> createState() => _ModuleBoxState();
}

class _ModuleBoxState extends State<ModuleBox> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                _scrollController.animateTo(
                    _scrollController.position.minScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn);
              },
              icon: const Icon(
                Icons.expand_less,
              )),
          Flexible(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 2, 0, 10),
                    child: FrontCard(index: 0),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 2, 0, 10),
                    child: FrontCard(index: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 10),
                    child: FrontCard(index: 2),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 10),
                    child: FrontCard(index: 3),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 10),
                    child: FrontCard(index: 4),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 10),
                    child: FrontCard(index: 5),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 10),
                    child: FrontCard(index: 6),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 10),
                    child: FrontCard(index: 7),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 10),
                    child: FrontCard(index: 8),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 10),
                    child: FrontCard(index: 9),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 10),
                    child: FrontCard(index: 10),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn);
              },
              icon: const Icon(
                Icons.expand_more,
              )),
        ],
      ),
    );
  }
}

class Fees extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  Fees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              _scrollController.animateTo(
                  _scrollController.position.minScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn);
            },
            icon: const Icon(
              Icons.expand_less,
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: SizedBox(
                height: 258,
                child: ListView(
                  controller: _scrollController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        shadowColor: const Color(0xff361553),
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: Container(
                          height: 240,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                                child: Text(
                                  "Early Bird",
                                  style: TextStyle(
                                    fontFamily: 'Anton',
                                    fontSize: 30,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(40, 8, 0, 20),
                                    child: Text(
                                      "Per Participant :",
                                      style: TextStyle(
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(8, 8, 0, 20),
                                    child: Text(
                                      "2500",
                                      style: TextStyle(
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Color(0xffae52e0)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(40, 8, 0, 8),
                                    child: Text(
                                      "Team Registration :",
                                      style: TextStyle(
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                                    child: Text(
                                      "2500",
                                      style: TextStyle(
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Color(0xffae52e0)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 5,
                        shadowColor: const Color(0xff361553),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: Container(
                          height: 240,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                                child: Text(
                                  "Regular registration",
                                  style: TextStyle(
                                    fontFamily: 'Anton',
                                    fontSize: 27,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(40, 8, 0, 20),
                                    child: Text(
                                      "Per Participant :",
                                      style: TextStyle(
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(8, 8, 0, 20),
                                    child: Text(
                                      "3500",
                                      style: TextStyle(
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Color(0xffae52e0)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(40, 8, 0, 8),
                                    child: Text(
                                      "Team Registration :",
                                      style: TextStyle(
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                                    child: Text(
                                      "2500",
                                      style: TextStyle(
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Color(0xffae52e0)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
        IconButton(
            onPressed: () {
              _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn);
            },
            icon: const Icon(
              Icons.expand_more,
            )),
      ],
    );
  }
}

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://www.instagram.com/epsilon.2023/?hl=en');
    Future<void> _launchUrll() async {
      if (!await launchUrl(url)) {
        throw 'Could not launch $url';
      }
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
          elevation: 5,
          shadowColor: const Color(0xff361553),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Container(
            height: 240,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Get in touch",
                        style: TextStyle(
                          fontFamily: 'Syne',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "You can contact us anytime via",
                        style: TextStyle(
                          fontFamily: 'Syne',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: TextButton(
                      onPressed: () async {
                        var result = await OpenMailApp.openMailApp();
                        if (!result.didOpen && !result.canOpen) {
                          showNoMailAppsDialog(context);
                        } else if (!result.didOpen && result.canOpen) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return MailAppPickerDialog(
                                mailApps: result.options,
                              );
                            },
                          );
                        }
                      },
                      child: const Text("epsilon@alpha.edu.pk",
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontSize: 20,
                              fontFamily: "Syne")),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Or follow us on",
                        style: TextStyle(
                          fontFamily: 'Syne',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_downward,
                    color: Color(0xff361553),
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: _launchUrll,
                      child: Image.asset('assets/instagram.png')),
                )
              ],
            ),
          )),
    );
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Open Mail App"),
          content: const Text("No mail apps installed"),
          actions: <Widget>[
            MaterialButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}

class Dates extends StatelessWidget {
  const Dates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 5,
        shadowColor: const Color(0xff361553),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: Container(
          height: 240,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                child: Text(
                  "DATES",
                  style: TextStyle(
                    fontFamily: 'Anton',
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 20),
                    child: Text(
                      "Day 1 :",
                      style: TextStyle(
                        fontFamily: 'Syne',
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 20),
                    child: Text(
                      "20th Jan",
                      style: TextStyle(
                        fontFamily: 'Syne',
                        fontSize: 25,
                        color: Color(0xffae52e0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 20),
                    child: Text(
                      "Day 2 :",
                      style: TextStyle(
                          fontFamily: 'Syne',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 20),
                    child: Text(
                      "21st Jan",
                      style: TextStyle(
                          fontFamily: 'Syne',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xffae52e0)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Text(
                      "Day 3 :",
                      style: TextStyle(
                          fontFamily: 'Syne',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                    child: Text(
                      "22nd Jan",
                      style: TextStyle(
                          fontFamily: 'Syne',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xffae52e0)),
                    ),
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
