import 'package:epsilonv7/components/moduleSelection.dart';
import 'package:epsilonv7/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state-manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

Map<String, String> imagesData = {
  "Autocode": 'assets/autocode.jpg',
  "Euclid's Elements": 'assets/euclids.jpg',
  "Sceptical Chymist": 'assets/chymist.jpg',
  "RoboSonic": 'assets/robosonic.jpg',
  "Voltaic": 'assets/voltaic.jpg',
  "Escherian Stairwell": 'assets/stairwell.jpg',
  "Area 51": 'assets/area51bg.jpg',
  "Cicada 3301": 'assets/cicada.jpg',
  "Cerebral Labyrinth": 'assets/cerebral.png',
  "Carson's Conundrum": 'assets/carson.png',
  "Psychosphere": 'assets/psycho.png'
};

class ModulesPortal extends StatefulWidget {
  const ModulesPortal({Key? key}) : super(key: key);

  @override
  State<ModulesPortal> createState() => _ModulesPortalState();
}

class _ModulesPortalState extends State<ModulesPortal> {
  TextEditingController code = TextEditingController();
  final _formkey = GlobalKey<FormState>();
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
          var modules = hello["modules"];
          print(modules.toString());
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 0, 0),
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
                                    "Modules",
                                    style: TextStyle(
                                        color: Color(0xff361553),
                                        fontSize: 30,
                                        fontFamily: "Syne",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(50, 3, 0, 0),
                                  child: Text(
                                    "Selected Modules",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "Syne",
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 15, 0),
                          child: MaterialButton(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            color: primary,
                            onPressed: () => showDialog<String>(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                title: const Center(
                                  child: Text(
                                    "Confirmation",
                                    style: TextStyle(
                                        color: primary,
                                        fontFamily: "Syne",
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                content: const SizedBox(
                                  height: 70,
                                  child: Center(
                                    child: Text(
                                        "By clicking 'Next' a verification code will be sent to the head delegate's email address."),
                                  ),
                                ),
                                actions: <Widget>[
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: MaterialButton(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            color: primary,
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Syne",
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: MaterialButton(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            color: primary,
                                            onPressed: () {
                                              Navigator.pop(context, "cancel");
                                              myProvider
                                                  .changeModuleCode(context);
                                              showDialog<String>(
                                                barrierDismissible: false,
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                  title: const Center(
                                                    child: Text(
                                                      "Verification code",
                                                      style: TextStyle(
                                                          color: primary,
                                                          fontFamily: "Syne",
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  content: Form(
                                                    key: _formkey,
                                                    child: SizedBox(
                                                      height: 100,
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  4, 8, 4, 8),
                                                          child: TextFormField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: code,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .onUserInteraction,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            style:
                                                                const TextStyle(
                                                              color: Color(
                                                                  0xff361553),
                                                              fontSize: 35,
                                                              fontFamily:
                                                                  'Anton',
                                                              letterSpacing:
                                                                  8.0,
                                                            ),
                                                            cursorColor:
                                                                const Color(
                                                                    0xffaf52e0),
                                                            decoration: const InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        vertical:
                                                                            18,
                                                                        horizontal:
                                                                            10.0),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        width:
                                                                            2,
                                                                        color: Color(
                                                                            0xff361553)),
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            10))),
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        width:
                                                                            2,
                                                                        color: Color(
                                                                            0xffeeeeee)),
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(10))),
                                                                focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.red), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                filled: true,
                                                                fillColor: Color(0xfff8f8f8)),
                                                            validator: (value) {
                                                              value == null ||
                                                                      value
                                                                          .isEmpty
                                                                  ? "Please enter code to continue"
                                                                  : null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                MaterialButton(
                                                              shape: const RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10))),
                                                              color: primary,
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context,
                                                                    'Cancel');
                                                                code.text = "";
                                                              },
                                                              child: const Text(
                                                                'Cancel',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        "Syne",
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                MaterialButton(
                                                              shape: const RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10))),
                                                              color: primary,
                                                              onPressed: () {
                                                                if (code.text !=
                                                                    "") {
                                                                  myProvider.changeModuleVerify(
                                                                      context,
                                                                      code.text);
                                                                  if (myProvider
                                                                      .modState) {
                                                                    myProvider
                                                                            .modState =
                                                                        false;
                                                                    Navigator.pop(
                                                                        context,
                                                                        "cancel");
                                                                    showDialog<
                                                                        String>(
                                                                      barrierDismissible:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder: (BuildContext
                                                                              context) =>
                                                                          AlertDialog(
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(10))),
                                                                        /*title: const Center(
                                                                          child: Text(
                                                                            "Verification code",
                                                                            style: TextStyle(
                                                                                color: primary,
                                                                                fontFamily: "Syne",
                                                                                fontSize: 25,
                                                                                fontWeight:
                                                                                FontWeight.bold),
                                                                          ),
                                                                        ),*/
                                                                        content:
                                                                            const SingleChildScrollView(
                                                                          child:
                                                                              ModuleSelector(),
                                                                        ),
                                                                        actions: <
                                                                            Widget>[
                                                                          Center(
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: MaterialButton(
                                                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                    color: primary,
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context, 'Cancel');
                                                                                      code.text = "";
                                                                                      myProvider.setstemModules([]);
                                                                                    },
                                                                                    child: const Text(
                                                                                      'Cancel',
                                                                                      style: TextStyle(color: Colors.white, fontFamily: "Syne", fontSize: 15),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: MaterialButton(
                                                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                    color: primary,
                                                                                    onPressed: () {
                                                                                      if (myProvider.stemmodules.length > 3 && myProvider.stemmodules.length < 7) {
                                                                                        myProvider.changeModules(context);
                                                                                        Navigator.pop(context);
                                                                                        setState(() {});
                                                                                      } else {
                                                                                        Fluttertoast.showToast(msg: "Choose modules between 4 and 6.", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.deepPurpleAccent, textColor: Colors.white, fontSize: 16.0);
                                                                                      }
                                                                                    },
                                                                                    child: const Text(
                                                                                      'Done',
                                                                                      style: TextStyle(color: Colors.white, fontFamily: "Syne", fontSize: 15),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  } else{
                                                                    Fluttertoast.showToast(msg: "Incorrect code.", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.deepPurpleAccent, textColor: Colors.white, fontSize: 16.0);
                                                                  }
                                                                } else{
                                                                  Fluttertoast.showToast(msg: "Check head email for code.", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.deepPurpleAccent, textColor: Colors.white, fontSize: 16.0);
                                                                }
                                                              },
                                                              child: const Text(
                                                                'Next',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        "Syne",
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'Next',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Syne",
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            height: 50,
                            minWidth: 50,
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    for (var i = 0; i < modules.length; i++)
                      ModuleBox(name: imagesData[modules[i]]!, text: modules[i])
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

class ModuleBox extends StatelessWidget {
  final String name;
  final String text;

  const ModuleBox({Key? key, required this.name, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 170,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 75,
                          ),
                          Text(
                            text,
                            style: const TextStyle(
                              color: Color(0xffaf52e0),
                              fontFamily: "Syne",
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 105,
                  width: MediaQuery.of(context).size.width * 0.72,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                          image: AssetImage(name), fit: BoxFit.cover)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
