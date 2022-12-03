import 'package:flutter/material.dart';

class RegisSuccess extends StatelessWidget {
  const RegisSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                      color: Color(0xff361553),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      "Registration Successful",
                      style: TextStyle(
                          color: Colors.white, fontFamily: "Anton", fontSize: 30),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color(0xfff8f8f8),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                        child: Text(
                          "It is advised to take a screenshot of this page",
                          style: TextStyle(
                              color: Color(0xff361553),
                              fontFamily: "Syne",
                              fontSize: 15,
                          fontWeight:FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "1) Check head delegate's email. You have been sent your login credentials.",
                            style: TextStyle(
                                color: Color(0xff361553),
                                fontSize: 18,
                                fontFamily: "OpenSan",
                            fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(color: Color(0xff361553),thickness: 5,),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "2) Enter those details into the login page of the app to gain access to your portal.",
                            style: TextStyle(
                                color: Color(0xff361553),
                                fontSize: 18,
                                fontFamily: "OpenSan",
                            fontWeight: FontWeight.bold),
                          ),
                        ),Divider(color: Color(0xff361553),thickness: 5,),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "3) Your registration is still in waitlist until you upload your proof of payment via your portal.",
                            style: TextStyle(
                                color: Color(0xff361553),
                                fontSize: 18,
                                fontFamily: "OpenSan",
                            fontWeight: FontWeight.bold),
                          ),
                        ),Divider(color: Color(0xff361553),thickness: 5,),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Thank you for being part of this amazing journey.",
                            style: TextStyle(
                                color: Color(0xff361553),
                                fontSize: 18,
                                fontFamily: "OpenSan",
                            fontWeight: FontWeight.bold),
                          ),
                        ),Divider(color: Color(0xff361553),thickness: 5,),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),

      ),
    );
  }
}
