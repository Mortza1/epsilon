import 'package:epsilonv7/screens/forgotPage2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_state-manager.dart';

class ForgotPage1 extends StatefulWidget {
  const ForgotPage1({Key? key}) : super(key: key);

  @override
  State<ForgotPage1> createState() => _ForgotPage1State();
}

class _ForgotPage1State extends State<ForgotPage1> {
  TextEditingController hdEmail = TextEditingController();
  TextEditingController regisId = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final AppStateManager myProvider = Provider.of<AppStateManager>(context);
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Anton',
                        color: Color(0xff361553)),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Material(
                    elevation: 20,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    shadowColor: Colors.purple,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(30))),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(15, 25, 15, 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                    child: Text(
                                      "Head Delegate Email",
                                      style: TextStyle(
                                        color: Color(0xffaf52e0),
                                        fontSize: 18,
                                        fontFamily: 'Syne',
                                        fontWeight: FontWeight.bold,),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(4, 8, 4, 8),
                                    child: TextFormField(
                                      controller: hdEmail,
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      keyboardType: TextInputType.emailAddress,
                                      style: const TextStyle(
                                        color: Color(0xff361553),
                                        fontSize: 20,
                                        fontFamily: 'Syne',
                                        fontWeight: FontWeight.bold,),
                                      cursorColor: const Color(0xffaf52e0),
                                      decoration: const InputDecoration(
                                          contentPadding:
                                          EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 10.0),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color(0xff361553)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color(0xffeeeeee)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          focusedErrorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors.red),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.all(Radius.circular(30))),
                                          filled: true,
                                          fillColor: Color(0xfff8f8f8)),
                                      validator: (value) {
                                        if (value != null &&
                                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(value)) {
                                          return 'Please enter a valid email';
                                        }
                                        return null;
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(24, 0, 0, 0),
                                      child: Text(
                                        "Registration ID",
                                        style: TextStyle(
                                          color: Color(0xffaf52e0),
                                          fontSize: 18,
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.bold,),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          4, 8, 4, 8),
                                      child: TextFormField(
                                        controller: regisId,
                                        autovalidateMode: AutovalidateMode
                                            .onUserInteraction,
                                        keyboardType: TextInputType.text,
                                        style: const TextStyle(
                                          color: Color(0xff361553),
                                          fontSize: 20,
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.bold,),
                                        cursorColor: const Color(0xff361553),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 10.0),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 2,
                                                    color: Color(0xff361553)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 2,
                                                    color: Color(0xffeeeeee)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            focusedErrorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 2,
                                                    color: Colors.red),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            errorBorder:
                                            OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.all(Radius.circular(30))),
                                            filled: true,
                                            fillColor: Color(0xfff8f8f8)),
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return 'Please enter a valid password';
                                          }
                                          return null;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(15, 15, 15, 8),
                              child: MaterialButton(
                                onPressed: () {
                                  //if(_formkey.currentState!.validate()){}
                                    myProvider.forgotPassword(regisId.text, hdEmail.text, context);

                                },
                                height: 50,
                                minWidth:
                                MediaQuery.of(context).size.width * 0.9,
                                color: const Color(0xff361553),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))),
                                child: const Text(
                                  "Enter",
                                  style: TextStyle(
                                      fontFamily: "Syne",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffffffff),
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
