import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state-manager.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
          //print(hello);
          var status = hello["paymentStatus"];
          var members = hello["members"];
          var payment = hello["payment"];
          var NumOfMembers = members.length;
          //var x = 2500;
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.popUntil(
                                    context, ModalRoute.withName('/'));
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
                            "Payment",
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
                            "Payment details",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Syne",
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Total Amount",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "Syne",
                                        fontSize: 15),
                                  ),
                                ),
                                Text(
                                  "Rs $payment.00",
                                  style: const TextStyle(
                                      color: Color(0xff361553),
                                      fontSize: 35,
                                      fontFamily: "Syne",
                                      fontWeight: FontWeight.bold),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Divider(
                                    color: Color(0xff361553),
                                    thickness: 4,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Fee Summary",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: "Syne",
                                            fontSize: 20),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                      "Members",
                                      style: TextStyle(
                                          color: Color(0xff361553),
                                          fontSize: 25,
                                          fontFamily: "Syne",
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Rs ${((payment - 2500)/NumOfMembers).round()}",
                                      style: const TextStyle(
                                          color: Color(0xffaf52e0),
                                          fontSize: 25,
                                          fontFamily: "Syne",
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      "Delegation",
                                      style: TextStyle(
                                          color: Color(0xff361553),
                                          fontSize: 25,
                                          fontFamily: "Syne",
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Rs 2500",
                                      style: TextStyle(
                                          color: Color(0xffaf52e0),
                                          fontSize: 25,
                                          fontFamily: "Syne",
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: 60,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Payment Status",
                                      style: TextStyle(
                                          color: Color(0xff361553),
                                          fontSize: 20,
                                          fontFamily: "Syne"),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 2, 10, 2),
                                    child: Container(
                                      width: 150,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(30))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            status,
                                            style: const TextStyle(
                                                color: Color(0xffaf52e0),
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                //border: Border.all(color: Colors.black, width: 3)
                                ),
                            child: Column(
                              children: [
                                const Text(
                                  "Upload proof of payment image",
                                  style: TextStyle(
                                      color: Color(0xffaf52e0), fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    myProvider.getImage();
                                  },
                                  height: 50,
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.5,
                                  color: Colors.yellow,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: const Text(
                                    "Fetch Image",
                                    style: TextStyle(
                                        fontFamily: "Syne",
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    if (myProvider.image.path.isNotEmpty) {
                                      myProvider.proofOfpayment(context);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Select an image first.",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor:
                                              Colors.deepPurpleAccent,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  },
                                  height: 50,
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.9,
                                  color: const Color(0xff361553),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: const Text(
                                    "Upload",
                                    style: TextStyle(
                                        fontFamily: "Syne",
                                        color: Color(0xffffffff),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
