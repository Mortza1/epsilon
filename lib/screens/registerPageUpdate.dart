import 'package:epsilonv7/components/Member1.dart';
import 'package:epsilonv7/components/brandAmbasBox.dart';
import 'package:epsilonv7/components/moduleSelection.dart';
import 'package:epsilonv7/components/phone.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: EpsilonPages.registerPage,
        key: ValueKey(EpsilonPages.registerPage),
        child: const RegisterPage());
  }

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _headKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _mem2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _teamKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _mem3Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _mem4Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _mem5Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _mem6Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _mem7Key = GlobalKey<FormState>();
  int number = 0;
  bool mem5 = false;
  bool mem6 = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final AppStateManager myProvider = Provider.of<AppStateManager>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xfff8f8f8),
      body: SafeArea(
          child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.popUntil(
                            context, ModalRoute.withName('/landing'));
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xff361553),
                        size: 30,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Anton',
                        color: Color(0xff361553)),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "Create your delegation and add",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Syne',
                        color: Colors.grey,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "your member details",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Syne',
                        color: Colors.grey,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                if (number == 0)
                  TeamDetails(
                    headformKey: _teamKey,
                  ),
                if (number == 1) const Modules(),
                if (number == 2) HeadDelegate(headformKey: _headKey),
                if (number == 3) Delegate2(formKey: _mem2Key),
                if (number == 4) Delegate3(formKey: _mem3Key),
                if (number == 5)
                  Delegate4(
                    formKey: _mem4Key,
                  ),
                if (number == 6) Delegate5(formKey: _mem5Key),
                if (number == 7)
                  Delegate6(
                    formKey: _mem6Key,
                  ),
                if (number == 8)
                  Delegate7(
                    formKey: _mem7Key,
                  ),
                number == 0
                    ? Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                if (_teamKey.currentState!.validate()) {
                                  setState(() {
                                    number++;
                                  });
                                }
                              },
                              height: 40,
                              minWidth: MediaQuery.of(context).size.width * 0.35,
                              color: const Color(0xff361553),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                    fontFamily: "Anton",
                                    color: Color(0xffffffff),
                                    fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      )
                    : number > 4 && number < 8
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          number--;
                                        });
                                      },
                                      height: 40,
                                      minWidth:
                                          MediaQuery.of(context).size.width *
                                              0.35,
                                      color: const Color(0xff361553),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: const Text(
                                        "Back",
                                        style: TextStyle(
                                            fontFamily: "Anton",
                                            color: Color(0xffffffff),
                                            fontSize: 17),
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        if (number == 5) {
                                          if (_mem4Key.currentState!.validate()) {
                                            setState(() {
                                              number++;
                                            });
                                          }
                                        } else if (number == 6) {
                                          if (_mem5Key.currentState!.validate()) {
                                            setState(() {
                                              number++;
                                            });
                                          }
                                        } else if (number == 7) {
                                          if (_mem6Key.currentState!.validate()) {
                                            setState(() {
                                              number++;
                                            });
                                          }
                                        }
                                      },
                                      height: 40,
                                      minWidth:
                                          MediaQuery.of(context).size.width *
                                              0.35,
                                      color: const Color(0xff361553),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: const Text(
                                        "Add Member",
                                        style: TextStyle(
                                            fontFamily: "Anton",
                                            color: Color(0xffffffff),
                                            fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        if (number == 5) {
                                          if (_mem4Key.currentState!.validate()) {
                                            if (kDebugMode) {
                                              print("Successful");
                                            }
                                            myProvider.registerData(context,
                                                _scaffoldKey.currentContext);
                                          } else {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Please complete delegate 4 details.",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor:
                                                    Colors.deepPurpleAccent,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }
                                        } else {
                                          if (kDebugMode) {
                                            print("Successful");
                                          }
                                          myProvider.registerData(context,
                                              _scaffoldKey.currentContext);
                                        }
                                        /* if (myProvider.inputValidator()) {
                                      print("Successful");
                                      myProvider.registerData(context);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg:
                                          "You have some errors in your form. Please fix them before continuing.",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.deepPurpleAccent,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }*/
                                      },
                                      height: 50,
                                      minWidth:
                                          MediaQuery.of(context).size.width * 0.8,
                                      color: const Color(0xff361553),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: const Text(
                                        "Register",
                                        style: TextStyle(
                                            fontFamily: "Anton",
                                            color: Color(0xffffffff),
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : number == 8
                            ? Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              number--;
                                            });
                                          },
                                          height: 40,
                                          minWidth:
                                              MediaQuery.of(context).size.width *
                                                  0.35,
                                          color: const Color(0xff361553),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          child: const Text(
                                            "Back",
                                            style: TextStyle(
                                                fontFamily: "Anton",
                                                color: Color(0xffffffff),
                                                fontSize: 17),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        MaterialButton(
                                          onPressed: () {
                                            if (kDebugMode) {
                                              print("Successful");
                                            }
                                            myProvider.registerData(context,
                                                _scaffoldKey.currentContext);
                                            /* if (myProvider.inputValidator()) {
                                      print("Successful");
                                      myProvider.registerData(context);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg:
                                          "You have some errors in your form. Please fix them before continuing.",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.deepPurpleAccent,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }*/
                                          },
                                          height: 50,
                                          minWidth:
                                              MediaQuery.of(context).size.width *
                                                  0.8,
                                          color: const Color(0xff361553),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: const Text(
                                            "Register",
                                            style: TextStyle(
                                                fontFamily: "Anton",
                                                color: Color(0xffffffff),
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          number--;
                                        });
                                      },
                                      height: 40,
                                      minWidth:
                                          MediaQuery.of(context).size.width *
                                              0.35,
                                      color: const Color(0xff361553),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: const Text(
                                        "Back",
                                        style: TextStyle(
                                            fontFamily: "Anton",
                                            color: Color(0xffffffff),
                                            fontSize: 17),
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        if (number == 1) {
                                          if (myProvider.stemmodules.length > 6 || myProvider.stemmodules.length < 4) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Choose 4 to 6 modules to continue",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor:
                                                    Colors.deepPurpleAccent,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          } else {
                                            setState(() {
                                              number++;
                                            });
                                          }
                                        } else if (number == 2) {
                                          if (_headKey.currentState!.validate()) {
                                            setState(() {
                                              number++;
                                            });
                                          }
                                        } else if (number == 3) {
                                          if (_mem2Key.currentState!.validate()) {
                                            setState(() {
                                              number++;
                                            });
                                          }
                                        } else if (number == 4) {
                                          if (_mem3Key.currentState!.validate()) {
                                            setState(() {
                                              number++;
                                            });
                                          }
                                        }
                                      },
                                      height: 40,
                                      minWidth:
                                          MediaQuery.of(context).size.width *
                                              0.35,
                                      color: const Color(0xff361553),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: const Text(
                                        "Next",
                                        style: TextStyle(
                                            fontFamily: "Anton",
                                            color: Color(0xffffffff),
                                            fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeadDelegate extends StatefulWidget {
  final GlobalKey headformKey;

  const HeadDelegate({Key? key, required this.headformKey}) : super(key: key);

  @override
  State<HeadDelegate> createState() => _HeadDelegateState();
}

class _HeadDelegateState extends State<HeadDelegate> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController instituteController;
  late TextEditingController phoneController;
  String hello = "private";

  @override
  void initState() {
    final AppStateManager myProvider =
        Provider.of<AppStateManager>(context, listen: false);

    super.initState();
    nameController = TextEditingController(text: myProvider.headDelegateName);
    emailController = TextEditingController(text: myProvider.headEmail);
    phoneController = TextEditingController(text: myProvider.hdPhone);
    instituteController =
        TextEditingController(text: myProvider.headInstitution);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    instituteController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  String _groupValue = "Private";
  @override
  Widget build(BuildContext context) {
    final AppStateManager myProvider = Provider.of<AppStateManager>(context);
    return Material(
      child: Container(
        color: const Color(0xfff8f8f8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 8),
                  child: Text(
                    "Head Delegate Details",
                    style: TextStyle(
                        color: Color(0xff361553),
                        fontSize: 25,
                        fontFamily: "Anton"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  children: [
                    Form(
                      key: widget.headformKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          TextField(
                            controller: nameController,
                            onChanged: myProvider.setHeadDelegateName,
                            header: 'Head Delegate name',
                            action: TextInputAction.next,
                            errorText: "Please enter HD name",
                            keyType: TextInputType.name,
                            validator: (value) => value == null || value.isEmpty
                                ? 'Enter your name'
                                : !RegExp('[a-zA-Z]').hasMatch(value)
                                    ? 'Enter a valid name'
                                    : null,
                          ),
                          TextField(
                              controller: emailController,
                              onChanged: myProvider.setHeadEmail,
                              header: 'Head Delegate Email',
                              action: TextInputAction.next,
                              errorText: "Please enter HD email",
                              keyType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value != null &&
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              }),
                          PhoneTextfield(
                            onChange: (PhoneNumber number) {
                              var isolength = number.isoCode?.length;
                              var hh = number.phoneNumber;
                              var hello = number.phoneNumber?.substring(
                                isolength! + 1,
                              );
                              myProvider.setHDphone(hello!);
                              myProvider.setHDphoneComplete(hh!);
                            },
                            controller: phoneController,
                            validator: (value) => value == null || value.isEmpty
                                ? "Please a phone number"
                                : myProvider.hdPhoneComplete.substring(0, 3) ==
                                            "+92" &&
                                        value.length != 10
                                    ? "enter 10 digit number"
                                    : value.length < 5 || value.length > 13
                                        ? "enter valid number"
                                        : null,
                          ),
                          InstituteBox(
                            groupValue: _groupValue,
                            onChange: (value) {
                              setState(() {
                                _groupValue = value.toString();
                                myProvider.setheadIns(value.toString());
                                print(myProvider.headIns);
                              });
                            },
                            controller: instituteController,
                            onChanged: myProvider.setHeadInstitution,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController controller;
  final TextInputAction action;
  final String header;
  final String errorText;
  final TextInputType keyType;
  final String? Function(String?)? validator;

  const TextField({
    Key? key,
    required this.header,
    required this.action,
    required this.keyType,
    required this.errorText,
    required this.onChanged,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
            child: Text(
              header,
              style: const TextStyle(
                  color: Color(0xffaf52e0),
                  fontSize: 18,
                  fontFamily: 'Syne',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
            child: TextFormField(
                controller: controller,
                onChanged: onChanged,
                textInputAction: action,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: keyType,
                style: const TextStyle(
                    color: Color(0xff361553), fontSize: 20, fontFamily: 'Syne'),
                cursorColor: const Color(0xff361553),
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 20.0),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xff361553)),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xffeeeeee)),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    filled: true,
                    fillColor: Color(0xfff8f8f8)),
                validator: validator),
          )
        ],
      ),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController controller;
  final TextInputAction action;
  final String header;
  final String errorText;
  final TextInputType keyType;
  final bool obscure;
  final String? Function(String?)? validator;

  const TextFieldPassword(
      {Key? key,
      required this.header,
      required this.action,
      required this.keyType,
      required this.errorText,
      required this.onChanged,
      required this.controller,
      required this.obscure,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
            child: Text(
              header,
              style: const TextStyle(
                color: Color(0xffaf52e0),
                fontSize: 18,
                fontFamily: 'Syne',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              obscureText: obscure,
              textInputAction: action,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: keyType,
              style: const TextStyle(
                  color: Color(0xff361553), fontSize: 20, fontFamily: 'Syne'),
              cursorColor: const Color(0xff361553),
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Color(0xff361553)),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Color(0xffeeeeee)),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  filled: true,
                  fillColor: Color(0xfff8f8f8)),
              validator: validator,
            ),
          )
        ],
      ),
    );
  }
}

class TeamDetails extends StatefulWidget {
  final GlobalKey headformKey;

  const TeamDetails({
    Key? key,
    required this.headformKey,
  }) : super(key: key);

  @override
  State<TeamDetails> createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  late TextEditingController noteController;
  late TextEditingController teamNameController;
  late TextEditingController passwordController;
  late TextEditingController passwordAgainController;

  @override
  void initState() {
    final AppStateManager myProvider =
        Provider.of<AppStateManager>(context, listen: false);

    super.initState();
    noteController = TextEditingController(text: myProvider.note);
    teamNameController = TextEditingController(text: myProvider.teamName);
    passwordController = TextEditingController(text: myProvider.password);
    passwordAgainController =
        TextEditingController(text: myProvider.passwordAgain);
  }

  @override
  void dispose() {
    noteController.dispose();
    teamNameController.dispose();
    passwordController.dispose();
    passwordAgainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppStateManager myProvider = Provider.of<AppStateManager>(context);
    return Container(
      color: const Color(0xfff8f8f8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 8),
                child: Text(
                  "Team Details",
                  style: TextStyle(
                      color: Color(0xff361553),
                      fontSize: 25,
                      fontFamily: "Anton"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                children: [
                  Form(
                    key: widget.headformKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        TextField(
                            controller: teamNameController,
                            onChanged: myProvider.setTeamName,
                            header: 'Team name',
                            action: TextInputAction.next,
                            errorText: "Please enter team name",
                            keyType: TextInputType.text,
                            validator: (value) => value == null || value.isEmpty
                                ? 'Enter team name'
                                : value.length < 3
                                    ? 'Enter name longer then 2 letters'
                                    : null),
                        TextField(
                          controller: noteController,
                          onChanged: myProvider.setnote,
                          header: 'Extra details for us?',
                          action: TextInputAction.next,
                          errorText: "Please enter team name",
                          keyType: TextInputType.text,
                        ),
                        TextFieldPassword(
                          controller: passwordController,
                          onChanged: myProvider.setpassword,
                          header: "Enter a password",
                          action: TextInputAction.next,
                          errorText: "Please enter a unique password",
                          keyType: TextInputType.text,
                          obscure: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            } else if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                                .hasMatch(value)) {
                              return 'Min requirements: >8, 1 upper, 1 lower, 1 digit';
                            }
                            return null;
                          },
                        ),
                        TextFieldPassword(
                          controller: passwordAgainController,
                          onChanged: myProvider.setpasswordAgain,
                          header: "Re-enter the password",
                          action: TextInputAction.next,
                          errorText: "Please enter a unique password",
                          keyType: TextInputType.text,
                          obscure: true,
                          validator: (value) {
                            if (myProvider.password !=
                                myProvider.passwordAgain) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),
                        const BrandField()
                        //const BrandField(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InstituteBox extends StatefulWidget {
  final String groupValue;
  final Function(String?) onChange;
  final Function(String) onChanged;
  final TextEditingController controller;

  const InstituteBox(
      {Key? key, required this.groupValue, required this.onChange, required this.onChanged, required this.controller})
      : super(key: key);

  @override
  State<InstituteBox> createState() => _InstituteBoxState();
}

class _InstituteBoxState extends State<InstituteBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(
        children: [
          widget.groupValue == "institute"
              ? Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: widget.controller,
                onChanged: widget.onChanged,
                header: "Enter institution name",
                action: TextInputAction.next,
                errorText: "Please enter institution name",
                keyType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter institution name';
                  }
                  return null;
                },
              ),
            ],
          )
              : const SizedBox(
            height: 0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: const Color(0xff361553), width: 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Institution data",
                        style: TextStyle(
                            color: Color(0xffaf52e0),
                            fontFamily: "Syne",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(
                            children: [
                              Radio(
                                value: "Private",
                                groupValue: widget.groupValue,
                                onChanged: widget.onChange,
                                activeColor: const Color(0xff361553),
                                materialTapTargetSize: MaterialTapTargetSize.padded,
                              ),
                              const Text(
                                "enter private",
                                style: TextStyle(
                                    color: Color(0xff361553),
                                    fontFamily: "Syne",
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Radio(
                                activeColor: const Color(0xff361553),
                                materialTapTargetSize: MaterialTapTargetSize.padded,
                                value: "Alpha College",
                                groupValue: widget.groupValue,
                                onChanged: widget.onChange),
                            const Text(
                              "Alpha College",
                              style: TextStyle(
                                  color: Color(0xff361553),
                                  fontFamily: "Syne",
                                  fontSize: 12),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(
                            children: [
                              Radio(
                                  activeColor: const Color(0xff361553),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                  value: "institute",
                                  groupValue: widget.groupValue,
                                  onChanged: widget.onChange),
                              const Text(
                                "enter institute",
                                style: TextStyle(
                                    color: Color(0xff361553),
                                    fontFamily: "Syne",
                                    fontSize: 12),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
