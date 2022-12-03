import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state-manager.dart';

class ForgotPage3 extends StatefulWidget {
  const ForgotPage3({Key? key}) : super(key: key);

  @override
  State<ForgotPage3> createState() => _ForgotPage3State();
}

class _ForgotPage3State extends State<ForgotPage3> {
  TextEditingController password = TextEditingController();
  TextEditingController passwordAgain = TextEditingController();
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
                    "Create Password",
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
                                      "Enter password",
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
                                      controller: password,
                                      obscureText: true,
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      keyboardType: TextInputType.text,
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
                                        "Re-enter password",
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
                                        controller: passwordAgain,
                                        obscureText: true,
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
                                          value == null || value.isEmpty? "Enter a password" : value != password.text ? 'Password do not match' : null;
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
                                  if(_formkey.currentState!.validate()){
                                  myProvider.changePass(passwordAgain.text, context);}

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
