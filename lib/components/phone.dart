import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Phone extends StatefulWidget {
  final TextEditingController phoneController;
  final Function(PhoneNumber) onChange;
  final String? Function(String?)? validator;

  const Phone({
    Key? key,
    required this.onChange,
    required this.phoneController, this.validator,
  }) : super(key: key);

  @override
  createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String initialCountry = 'PK';

  PhoneNumber number = PhoneNumber(isoCode: 'PK');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xfff8f8f8),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 8, 0),
              child: Container(
                child: InternationalPhoneNumberInput(
                  validator: widget.validator,
                  onInputChanged: widget.onChange,
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.DIALOG,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  selectorTextStyle: const TextStyle(
                      color: Color(0xff361553),
                      fontSize: 20,
                      fontFamily: "Syne",
                      fontWeight: FontWeight.bold),
                  initialValue: number,
                  textFieldController: widget.phoneController,
                  textStyle: const TextStyle(
                      color: Color(0xff361553),
                      fontFamily: "Syne",
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  formatInput: false,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputDecoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
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
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class PhoneTextfield extends StatelessWidget {
  final Function(PhoneNumber) onChange;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const PhoneTextfield(
      {Key? key, required this.onChange, required this.controller, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              child: Text(
                "Phone Number",
                style: TextStyle(
                    color: Color(0xffaf52e0),
                    fontSize: 18,
                    fontFamily: "Syne",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
              child: Phone(
                onChange: onChange,
                phoneController: controller,
                validator: validator,
              ),
            )
          ],
        ),
      ),
    );
  }
}
