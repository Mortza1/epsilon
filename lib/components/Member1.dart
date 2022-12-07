import 'package:epsilonv7/components/phone.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../models/app_state-manager.dart';
import '../screens/registerPageUpdate.dart';

class Delegate2 extends StatefulWidget {
  final GlobalKey formKey;

  const Delegate2({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  State<Delegate2> createState() => _Delegate2State();
}

class _Delegate2State extends State<Delegate2> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController instituteController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    final AppStateManager myProvider =
        Provider.of<AppStateManager>(context, listen: false);

    super.initState();
    nameController = TextEditingController(text: myProvider.member2name);
    emailController = TextEditingController(text: myProvider.member2email);
    instituteController =
        TextEditingController(text: myProvider.member2institute);
    phoneController = TextEditingController(text: myProvider.mem2Phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    instituteController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  String _groupValue = "private";
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
                  "Member 2 details",
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
              child: Form(
                key: widget.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                      controller: nameController,
                      onChanged: myProvider.setMember2name,
                      header: "Member name",
                      action: TextInputAction.next,
                      keyType: TextInputType.name,
                      errorText: 'Please enter a name',
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length == 1) {
                          return 'Please enter a valid name';
                        }
                        return null;
                      },
                    ),
                    TextField(
                      controller: emailController,
                      onChanged: myProvider.setMember2email,
                      header: "Email Address",
                      action: TextInputAction.next,
                      keyType: TextInputType.emailAddress,
                      errorText: 'Please enter a valid email',
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    PhoneTextfield(
                      onChange: (PhoneNumber number) {
                        var isolength = number.isoCode?.length;
                        var hh = number.phoneNumber;
                        var hello = number.phoneNumber?.substring(
                          isolength! + 1,
                        );
                        myProvider.setMem2phone(hello!);
                        myProvider.setMem2phoneComplete(hh!);
                      },
                      controller: phoneController,
                      validator: (value) => value == null || value.isEmpty
                          ? "Please a phone number"
                          : myProvider.mem2PhoneComplete.substring(0, 3) ==
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
                            myProvider.setmem2Ins(value.toString());
                            if (kDebugMode) {
                              print(myProvider.mem2Ins);
                            }
                          });
                        },
                      controller: instituteController,
                      onChanged: myProvider.setMember2institute,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Delegate3 extends StatefulWidget {
  final GlobalKey formKey;

  const Delegate3({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  State<Delegate3> createState() => _Delegate3State();
}

class _Delegate3State extends State<Delegate3> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController instituteController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    final AppStateManager myProvider =
        Provider.of<AppStateManager>(context, listen: false);

    super.initState();
    nameController = TextEditingController(text: myProvider.member3name);
    emailController = TextEditingController(text: myProvider.member3email);
    instituteController =
        TextEditingController(text: myProvider.member3institute);
    phoneController = TextEditingController(text: myProvider.mem3Phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    instituteController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  String _groupValue = "private";
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
                  "Member 3 details",
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
              child: Form(
                key: widget.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                        controller: nameController,
                        onChanged: myProvider.setMember3name,
                        header: "Member name",
                        action: TextInputAction.next,
                        keyType: TextInputType.name,
                        errorText: 'Please enter a name',
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length == 1) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        }),
                    TextField(
                        controller: emailController,
                        onChanged: myProvider.setMember3email,
                        header: "Email Address",
                        action: TextInputAction.next,
                        keyType: TextInputType.emailAddress,
                        errorText: 'Please enter a valid email',
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
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
                        myProvider.setMem3phone(hello!);
                        myProvider.setMem3phoneComplete(hh!);
                      },
                      controller: phoneController,
                      validator: (value) => value == null || value.isEmpty
                          ? "Please a phone number"
                          : myProvider.mem3PhoneComplete.substring(0, 3) ==
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
                          myProvider.setmem3Ins(value.toString());
                          if (kDebugMode) {
                            print(myProvider.mem3Ins);
                          }
                        });
                      },
                      controller: instituteController,
                      onChanged: myProvider.setMember3institute,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Delegate4 extends StatefulWidget {
  final GlobalKey formKey;

  const Delegate4({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  State<Delegate4> createState() => _Delegate4State();
}

class _Delegate4State extends State<Delegate4> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController instituteController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    final AppStateManager myProvider =
        Provider.of<AppStateManager>(context, listen: false);

    super.initState();
    nameController = TextEditingController(text: myProvider.member4name);
    emailController = TextEditingController(text: myProvider.member4email);
    instituteController =
        TextEditingController(text: myProvider.member4institute);
    phoneController = TextEditingController(text: myProvider.mem4Phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    instituteController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  String _groupValue = "private";
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
                  "Member 4 details",
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
              child: Form(
                key: widget.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                        controller: nameController,
                        onChanged: myProvider.setMember4name,
                        header: "Member name",
                        action: TextInputAction.next,
                        keyType: TextInputType.name,
                        errorText: 'Please enter a name',
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length == 1) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        }),
                    TextField(
                        controller: emailController,
                        onChanged: myProvider.setMember4email,
                        header: "Email Address",
                        action: TextInputAction.next,
                        keyType: TextInputType.emailAddress,
                        errorText: 'Please enter a valid email',
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
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
                        myProvider.setMem4phone(hello!);
                        myProvider.setMem4phoneComplete(hh!);
                      },
                      controller: phoneController,
                      validator: (value) => value == null || value.isEmpty
                          ? "Please a phone number"
                          : myProvider.mem4PhoneComplete.substring(0, 3) ==
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
                          myProvider.setmem4Ins(value.toString());
                          if (kDebugMode) {
                            print(myProvider.mem4Ins);
                          }
                        });
                      },
                      controller: instituteController,
                      onChanged: myProvider.setMember4institute,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Delegate5 extends StatefulWidget {
  final GlobalKey formKey;

  const Delegate5({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  State<Delegate5> createState() => _Delegate5State();
}

class _Delegate5State extends State<Delegate5> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController instituteController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    final AppStateManager myProvider =
        Provider.of<AppStateManager>(context, listen: false);

    super.initState();
    nameController = TextEditingController(text: myProvider.member5name);
    emailController = TextEditingController(text: myProvider.member5email);
    instituteController =
        TextEditingController(text: myProvider.member5institute);
    phoneController = TextEditingController(text: myProvider.mem5Phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    instituteController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  String _groupValue = "private";
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
                  "Member 5 details",
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
              child: Form(
                key: widget.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                      controller: nameController,
                      onChanged: myProvider.setMember5name,
                      header: "Member name",
                      action: TextInputAction.next,
                      keyType: TextInputType.name,
                      errorText: 'Please enter a name',
                    ),
                    TextField(
                        controller: emailController,
                        onChanged: myProvider.setMember5email,
                        header: "Email Address",
                        action: TextInputAction.next,
                        keyType: TextInputType.emailAddress,
                        errorText: 'Please enter a valid email',
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
                        myProvider.setMem5phone(hello!);
                        myProvider.setMem5phoneComplete(hh!);
                      },
                      controller: phoneController,
                      validator: (value) => value == null || value.isEmpty
                          ? "Please a phone number"
                          : myProvider.mem5PhoneComplete.substring(0, 3) ==
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
                          myProvider.setmem5Ins(value.toString());
                          if (kDebugMode) {
                            print(myProvider.mem5Ins);
                          }
                        });
                      },
                      controller: instituteController,
                      onChanged: myProvider.setMember5institute,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "If any field of delegate 5 is left emptied, delegate 5 will not be registered. Registration will continue with the rest of completed delegates. Completion till member 4 is necessary. ",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontFamily: "Syne",
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Delegate6 extends StatefulWidget {
  final GlobalKey formKey;

  const Delegate6({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  State<Delegate6> createState() => _Delegate6State();
}

class _Delegate6State extends State<Delegate6> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController instituteController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    final AppStateManager myProvider =
        Provider.of<AppStateManager>(context, listen: false);

    super.initState();
    nameController = TextEditingController(text: myProvider.member6name);
    emailController = TextEditingController(text: myProvider.member6email);
    instituteController =
        TextEditingController(text: myProvider.member6institute);
    phoneController = TextEditingController(text: myProvider.mem6Phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    instituteController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  String _groupValue = "private";
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
                  "Member 6 details",
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
              child: Form(
                key: widget.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                      controller: nameController,
                      onChanged: myProvider.setMember6name,
                      header: "Member name",
                      action: TextInputAction.next,
                      keyType: TextInputType.name,
                      errorText: 'Please enter a name',
                    ),
                    TextField(
                        controller: emailController,
                        onChanged: myProvider.setMember6email,
                        header: "Email Address",
                        action: TextInputAction.next,
                        keyType: TextInputType.emailAddress,
                        errorText: 'Please enter a valid email',
                        validator: (value) {
                          if (value != null &&
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
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
                        myProvider.setMem6phone(hello!);
                        myProvider.setMem6phoneComplete(hh!);
                      },
                      controller: phoneController,
                      validator: (value) => value == null || value.isEmpty
                          ? "Please a phone number"
                          : myProvider.mem6PhoneComplete.substring(0, 3) ==
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
                          myProvider.setmem6Ins(value.toString());
                          if (kDebugMode) {
                            print(myProvider.mem6Ins);
                          }
                        });
                      },
                      controller: instituteController,
                      onChanged: myProvider.setMember6institute,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "If any field of delegate 6 is left emptied, delegate 6 will not be registered. Registration will continue with the rest of completed delegates. Completion till member 4 is necessary. ",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontFamily: "Syne",
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Delegate7 extends StatefulWidget {
  final GlobalKey formKey;

  const Delegate7({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  State<Delegate7> createState() => _Delegate7State();
}

class _Delegate7State extends State<Delegate7> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController instituteController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    final AppStateManager myProvider =
        Provider.of<AppStateManager>(context, listen: false);

    super.initState();
    nameController = TextEditingController(text: myProvider.member7name);
    emailController = TextEditingController(text: myProvider.member7email);
    instituteController =
        TextEditingController(text: myProvider.member7institute);
    phoneController = TextEditingController(text: myProvider.mem7Phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    instituteController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  String _groupValue = "private";
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
                  "Member 7 details",
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
              child: Form(
                key: widget.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                      controller: nameController,
                      onChanged: myProvider.setMember7name,
                      header: "Member name",
                      action: TextInputAction.next,
                      keyType: TextInputType.name,
                      errorText: 'Please enter a name',
                    ),
                    TextField(
                        controller: emailController,
                        onChanged: myProvider.setMember7email,
                        header: "Email Address",
                        action: TextInputAction.next,
                        keyType: TextInputType.emailAddress,
                        errorText: 'Please enter a valid email',
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
                        myProvider.setMem7phone(hello!);
                        myProvider.setMem7phoneComplete(hh!);
                      },
                      controller: phoneController,
                      validator: (value) => value == null || value.isEmpty
                          ? "Please a phone number"
                          : myProvider.mem7PhoneComplete.substring(0, 3) ==
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
                          myProvider.setmem7Ins(value.toString());
                          if (kDebugMode) {
                            print(myProvider.mem7Ins);
                          }
                        });
                      },
                      controller: instituteController,
                      onChanged: myProvider.setMember7institute,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "If any field of delegate 7 is left emptied, delegate 7 will not be registered. Registration will continue with the rest of completed delegates. Completion till member 4 is necessary. ",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontFamily: "Syne",
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
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

  const TextField(
      {Key? key,
      required this.header,
      required this.action,
      required this.keyType,
      required this.errorText,
      required this.onChanged,
      required this.controller,
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
                  fontFamily: "Syne",
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
                  color: Color(0xff361553),
                  fontSize: 20,
                  fontFamily: "Syne",
                  fontWeight: FontWeight.bold),
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
