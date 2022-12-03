import 'package:epsilonv7/screens/forgotPage1.dart';
import 'package:epsilonv7/screens/registerPageUpdate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class LoginScreen extends StatefulWidget {

  static MaterialPage page() {
    return MaterialPage(
      name: EpsilonPages.loginPath,
      key: ValueKey(EpsilonPages.loginPath),
      child: LoginScreen(),
    );
  }

  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController num = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
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
                        "Login",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Anton',
                            color: Color(0xff361553)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        "Welcome Back |",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Syne',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        "Please enter your details.",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Syne',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
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
                                          "Registration Number",
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
                                          controller: num,
                                          textInputAction: TextInputAction.next,
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          keyboardType: TextInputType.number,
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
                                              return 'Please enter some text';
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
                                            "Password",
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
                                            controller: password,
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
                                      if(_formkey.currentState!.validate()){
                                      myProvider.loginData(num.text, password.text, context);}
                                    },
                                    height: 50,
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.9,
                                    color: const Color(0xff361553),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                          fontFamily: "Syne",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffffffff),
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const ForgotPage1()),
                                        );
                                      },
                                      child: const Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            color: Colors.deepPurpleAccent,
                                            fontSize: 15,
                                            fontFamily: "Syne",
                                          fontWeight: FontWeight.bold,),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Don't have an account?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontFamily: "Syne",
                              fontWeight: FontWeight.bold,),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          minWidth: MediaQuery.of(context).size.width * 0.85,
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
