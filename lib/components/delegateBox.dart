import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DelegateBox extends StatefulWidget {
  final int memberNum;
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController institution;

  const DelegateBox({
    Key? key,
    required this.memberNum,
    required this.phone,
    required this.institution,
    required this.name,
  }) : super(key: key);

  @override
  State<DelegateBox> createState() => _DelegateBoxState();
}

class _DelegateBoxState extends State<DelegateBox> {
  final List<String> items = [
    'With Social',
    'Without Social',
  ];
  String? feeStructure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 530,
                  decoration: const BoxDecoration(
                      color: Color(0xff5e17ff),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(140, 90))),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Member ${widget.memberNum} details",
                  style: const TextStyle(
                      color: Colors.white, fontSize: 30, fontFamily: 'Anton'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.yellow,
                    ),
                    prefixIconColor: Colors.white,
                    hintStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Anton',
                        color: Colors.white70),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Member Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  keyboardType: TextInputType.name,
                  style: const TextStyle(
                      fontSize: 20, fontFamily: 'Anton', color: Colors.white),
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  controller: widget.name,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter HD name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.call,
                      color: Colors.yellow,
                    ),
                    prefixIconColor: Colors.white,
                    hintStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Anton',
                        color: Colors.white70),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                      fontSize: 20, fontFamily: 'Anton', color: Colors.white),
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  controller: widget.phone,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone Number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.school,
                      color: Colors.yellow,
                    ),
                    prefixIconColor: Colors.white,
                    hintStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Anton',
                        color: Colors.white70),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Institution name or "Private"',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                      fontSize: 20, fontFamily: 'Anton', color: Colors.white),
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  controller: widget.institution,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter institution name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: const [
                        Icon(
                          Icons.list,
                          size: 25,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Fee Structure',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Anton',
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Center(
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Anton',
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ))
                        .toList(),
                    value: feeStructure,
                    onChanged: (value) {
                      setState(() {
                        feeStructure = value as String;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.yellow,
                    iconDisabledColor: Colors.grey,
                    buttonHeight: 70,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.white,
                      ),
                      color: const Color(0xff5e17ff),
                    ),
                    buttonElevation: 2,
                    itemHeight: 80,
                    dropdownMaxHeight: 180,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(width: 3, color: Colors.black),
                      color: const Color(0xff5e17ff),
                    ),
                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
    ;
  }
}
