import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:epsilonv7/screens/forgotPage3.dart';
import 'package:epsilonv7/screens/portal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/forgotPage2.dart';
import '../screens/regisSuccess.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class AppStateManager extends ChangeNotifier {
  // all head delegate credentials

  String _headIns = 'Private';

  String get headIns => _headIns;

  setheadIns(String headIns) {
    _headIns = headIns;
    notifyListeners();
  }

  String _headInstitution = '';

  String get headInstitution => _headInstitution;

  setHeadInstitution(String headInstitution) {
    _headInstitution = headInstitution;
    notifyListeners();
  }

  String _headDelegateName = '';

  String get headDelegateName => _headDelegateName;

  setHeadDelegateName(String headDelegateName) {
    _headDelegateName = headDelegateName;
    notifyListeners();
  }

  String _headEmail = '';

  String get headEmail => _headEmail;

  setHeadEmail(String headEmail) {
    _headEmail = headEmail;
    notifyListeners();
  }

  String _hdPhone = '';

  String get hdPhone => _hdPhone;

  setHDphone(String hdPhone) {
    _hdPhone = hdPhone;
    notifyListeners();
  }

  String _hdPhoneComplete = '';

  String get hdPhoneComplete => _hdPhoneComplete;

  setHDphoneComplete(String hdPhoneComplete) {
    _hdPhoneComplete = hdPhoneComplete;
    notifyListeners();
  }

//***************************************************************************************************************************************
  // all member 2 credentials

  String _mem2Ins = 'Private';

  String get mem2Ins => _mem2Ins;

  setmem2Ins(String headIns) {
    _mem2Ins = headIns;
    notifyListeners();
  }

  String _mem2Phone = '';

  String get mem2Phone => _mem2Phone;

  setMem2phone(String mem2Phone) {
    _mem2Phone = mem2Phone;
    notifyListeners();
  }

  String _mem2PhoneComplete = '';

  String get mem2PhoneComplete => _mem2PhoneComplete;

  setMem2phoneComplete(String mem2PhoneComplete) {
    _mem2PhoneComplete = mem2PhoneComplete;
    notifyListeners();
  }

  String _member2name = '';

  String get member2name => _member2name;

  setMember2name(String member2name) {
    _member2name = member2name;
    notifyListeners();
  }

  String _member2email = '';

  String get member2email => _member2email;

  setMember2email(String member2email) {
    _member2email = member2email;
    notifyListeners();
  }

  String _member2institute = '';

  String get member2institute => _member2institute;

  setMember2institute(String member2institute) {
    _member2institute = member2institute;
    notifyListeners();
  }

//****************************************************************************************************************************************
  // all member 3 details

  String _mem3Ins = 'Private';

  String get mem3Ins => _mem3Ins;

  setmem3Ins(String headIns) {
    _mem3Ins = headIns;
    notifyListeners();
  }

  String _mem3Phone = '';

  String get mem3Phone => _mem3Phone;

  setMem3phone(String mem3Phone) {
    _mem3Phone = mem3Phone;
    notifyListeners();
  }

  String _member3name = '';

  String get member3name => _member3name;

  setMember3name(String member3name) {
    _member3name = member3name;
    notifyListeners();
  }

  String _member3email = '';

  String get member3email => _member3email;

  setMember3email(String member3email) {
    _member3email = member3email;
    notifyListeners();
  }

  String _member3institute = '';

  String get member3institute => _member3institute;

  setMember3institute(String member3institute) {
    _member3institute = member3institute;
    notifyListeners();
  }

  String _mem3PhoneComplete = '';

  String get mem3PhoneComplete => _mem3PhoneComplete;

  setMem3phoneComplete(String mem3PhoneComplete) {
    _mem3PhoneComplete = mem3PhoneComplete;
    notifyListeners();
  }

//******************************************************************************************************************************************
  //all member 4 details

  String _mem4Ins = 'Private';

  String get mem4Ins => _mem4Ins;

  setmem4Ins(String headIns) {
    _mem4Ins = headIns;
    notifyListeners();
  }

  String _member4name = '';

  String get member4name => _member4name;

  setMember4name(String member4name) {
    _member4name = member4name;
    notifyListeners();
  }

  String _member4email = '';

  String get member4email => _member4email;

  setMember4email(String member4email) {
    _member4email = member4email;
    notifyListeners();
  }

  String _mem4PhoneComplete = '';

  String get mem4PhoneComplete => _mem4PhoneComplete;

  setMem4phoneComplete(String mem4PhoneComplete) {
    _mem4PhoneComplete = mem4PhoneComplete;
    notifyListeners();
  }

  String _member4institute = '';

  String get member4institute => _member4institute;

  setMember4institute(String member4institute) {
    _member4institute = member4institute;
    notifyListeners();
  }

  String _mem4Phone = '';

  String get mem4Phone => _mem4Phone;

  setMem4phone(String mem4Phone) {
    _mem4Phone = mem4Phone;
    notifyListeners();
  }

//******************************************************************************************************************************************
  //all member 5 details

  String _mem5Ins = 'Private';

  String get mem5Ins => _mem5Ins;

  setmem5Ins(String headIns) {
    _mem5Ins = headIns;
    notifyListeners();
  }

  String _mem6Phone = '';

  String get mem6Phone => _mem6Phone;

  setMem6phone(String mem6Phone) {
    _mem6Phone = mem6Phone;
    notifyListeners();
  }

  String _mem5Phone = '';

  String get mem5Phone => _mem5Phone;

  setMem5phone(String mem5Phone) {
    _mem5Phone = mem5Phone;
    notifyListeners();
  }

  String _member5name = '';

  String get member5name => _member5name;

  setMember5name(String member5name) {
    _member5name = member5name;
    notifyListeners();
  }

  String _member5email = '';

  String get member5email => _member5email;

  setMember5email(String member5email) {
    _member5email = member5email;
    notifyListeners();
  }

  String _member5institute = '';

  String get member5institute => _member5institute;

  setMember5institute(String member5institute) {
    _member5institute = member5institute;
    notifyListeners();
  }

  String _mem5PhoneComplete = '';

  String get mem5PhoneComplete => _mem5PhoneComplete;

  setMem5phoneComplete(String mem5PhoneComplete) {
    _mem5PhoneComplete = mem5PhoneComplete;
    notifyListeners();
  }

//******************************************************************************************************************************************
  //all member 6 details
  String _mem6Ins = 'Private';

  String get mem6Ins => _mem6Ins;

  setmem6Ins(String headIns) {
    _mem6Ins = headIns;
    notifyListeners();
  }

  String _member6name = '';

  String get member6name => _member6name;

  setMember6name(String member6name) {
    _member6name = member6name;
    notifyListeners();
  }

  String _member6email = '';

  String get member6email => _member6email;

  setMember6email(String member6email) {
    _member6email = member6email;
    notifyListeners();
  }

  String _mem6PhoneComplete = '';

  String get mem6PhoneComplete => _mem6PhoneComplete;

  setMem6phoneComplete(String mem6PhoneComplete) {
    _mem6PhoneComplete = mem6PhoneComplete;
    notifyListeners();
  }

  String _member6institute = '';

  String get member6institute => _member6institute;

  setMember6institute(String member6institute) {
    _member6institute = member6institute;
    notifyListeners();
  }

//******************************************************************************************************************************************
  //all member 7 details
  String _mem7Ins = 'Private';

  String get mem7Ins => _mem7Ins;

  setmem7Ins(String headIns) {
    _mem7Ins = headIns;
    notifyListeners();
  }

  String _mem7PhoneComplete = '';

  String get mem7PhoneComplete => _mem7PhoneComplete;

  setMem7phoneComplete(String mem7PhoneComplete) {
    _mem7PhoneComplete = mem7PhoneComplete;
    notifyListeners();
  }

  String _member7name = '';

  String get member7name => _member7name;

  setMember7name(String member7name) {
    _member7name = member7name;
    notifyListeners();
  }

  String _mem7Phone = '';

  String get mem7Phone => _mem7Phone;

  setMem7phone(String mem7Phone) {
    _mem7Phone = mem7Phone;
    notifyListeners();
  }

  String _member7email = '';

  String get member7email => _member7email;

  setMember7email(String member7email) {
    _member7email = member7email;
    notifyListeners();
  }

  String _member7institute = '';

  String get member7institute => _member7institute;

  setMember7institute(String member7institute) {
    _member7institute = member7institute;
    notifyListeners();
  }

//******************************************************************************************************************************************
  // all extra details
  List _stemmodules = [];

  List get stemmodules => _stemmodules;

  setstemModules(List modules) {
    _stemmodules = modules;
    notifyListeners();
  }

  String _password = '';

  String get password => _password;

  setpassword(String password) {
    _password = password;
    notifyListeners();
  }

  String _passwordAgain = '';

  String get passwordAgain => _passwordAgain;

  setpasswordAgain(String passwordAgain) {
    _passwordAgain = passwordAgain;
    notifyListeners();
  }

  String _teamName = '';

  String get teamName => _teamName;

  setTeamName(String teamName) {
    _teamName = teamName;
    notifyListeners();
  }

  String _note = '';

  String get note => _note;

  setnote(String note) {
    _note = note;
    notifyListeners();
  }

  String? _brandName;

  String? get brandName => _brandName;

  setbrandName(String brandName) {
    _brandName = brandName;
    notifyListeners();
  }

//******************************************************************************************************************************************
  //all calculations and data
  late String _hash;

  String get hash => _hash;

  setHash(String hash) {
    _hash = hash;
    notifyListeners();
  }

  File _image = File('');

  File get image => _image;

  setimage(File image) {
    _image = image;
    notifyListeners();
  }

  Map<String, dynamic> _jsonData = {};

  Map<String, dynamic> get jsonData => _jsonData;

  setjsonData(Map<String, dynamic> jsonData) {
    _jsonData = jsonData;
    notifyListeners();
  }

  bool _initialized = false;
  bool _registered = false;
  bool _loggedIn = false;
  bool _isLanded = false;
  bool _goToRegister = false;
  bool _goToLogin = false;

  late String _username;

  String get username => _username;

  setname(String username) {
    _username = username;
    notifyListeners();
  }

  bool get isInitialized => _initialized;

  bool get registered => _registered;

  bool get goToRegisters => _goToRegister;

  bool get goToLogin => _goToLogin;

  bool get isLoggedIn => _loggedIn;

  bool get isLanded => _isLanded;

  void initializeApp() async {
    final prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('hash');
    Timer(
      const Duration(milliseconds: 3000),
      () {
        if (action == null) {
          _initialized = true;
          notifyListeners();
        } else {
          setHash(action);
          _initialized = true;
          _loggedIn = true;
          notifyListeners();
        }
      },
    );
  }

  void login() {
    _loggedIn = true;
    notifyListeners();
  }

  loginData(String num, String password, context) async {
    SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
        context: context, barrierDimisable: false);
    dialog.show(
        message: 'Loading...',
        type: SimpleFontelicoProgressDialogType.normal,
        backgroundColor: Colors.deepPurpleAccent,
        indicatorColor: Colors.white,
        height: 100,
        width: 200,
        textStyle: const TextStyle(color: Colors.white));
    final prefs = await SharedPreferences.getInstance();
    var response = await http
        .post(Uri.parse("https://www.epsilon.net.pk/query.php"), body: {
      "query": "login",
      "regId": num,
      "password": password,
      "stayLoggedIn": "false"
    });
    dialog.hide();
    Navigator.of(context, rootNavigator: true).pop('dialog');
    if (response.body == "false") {
      return Fluttertoast.showToast(
          msg: "Login Unsuccessful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepPurpleAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      if (kDebugMode) {
        print(response.body);
      }
      setHash(json.decode(response.body));
      await prefs.setString('hash', json.decode(response.body));
      login();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Portal()),
      );
    }
  }

  String regisIDPass = "";
  String regisIDMod = "";
  String tempPass = "";
  String tempCode = "";
  String specialHash = "";
  bool modState = false;

  changeModuleCode(context) async {
    var response = await http
        .post(Uri.parse("https://www.epsilon.net.pk/query.php"), body: {
      "query": "changeModulesCode",
      "hash": _hash,
    });
    //Navigator.of(context, rootNavigator: true).pop('dialog');
    if (kDebugMode) {
      print(response.body);
    }
    if (response.body == "false") {
      return Fluttertoast.showToast(
          msg: "Network problem! Try again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepPurpleAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      regisIDMod = json.decode(response.body);
    }
  }
  changeModuleVerify(context, String code) async {
    var response = await http
        .post(Uri.parse("https://www.epsilon.net.pk/query.php"), body: {
      "query": "verifyCode",
      "regId": regisIDMod,
      "code" : code
    });
    //Navigator.of(context, rootNavigator: true).pop('dialog');
    if (kDebugMode) {
      print(response.body);
    }
    if (response.body == "false") {
      modState = false;
    } else {
      specialHash = json.decode(response.body);
      modState = true;
    }
  }

  changeModules(context) async {
    var response = await http
        .post(Uri.parse("https://www.epsilon.net.pk/query.php"), body: {
      "query": "changeModules",
      "hash": _hash,
      "hash2" : specialHash,
      "modules" : json.encode(_stemmodules)
    });
    //Navigator.of(context, rootNavigator: true).pop('dialog');
    if (kDebugMode) {
      print(response.body);
    }
    if (response.body == "false") {
      return Fluttertoast.showToast(
          msg: "Incorrect code.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepPurpleAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(response.body == "true"){
      specialHash = "";
      regisIDMod = "";
      _stemmodules = [];
      //Navigator.pop(context);
    }
  }

  forgotPassword(String regId, String email, context) async {
    SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
        context: context, barrierDimisable: false);
    dialog.show(
        message: 'Loading...',
        type: SimpleFontelicoProgressDialogType.normal,
        backgroundColor: Colors.deepPurpleAccent,
        indicatorColor: Colors.white,
        height: 100,
        width: 200,
        textStyle: const TextStyle(color: Colors.white));
    regisIDPass = regId;
    var response = await http
        .post(Uri.parse("https://www.epsilon.net.pk/query.php"), body: {
      "query": "forgotPassword",
      "regId": regId,
      "email": email,
    });
    dialog.hide();
    Navigator.of(context, rootNavigator: true).pop('dialog');
    if (kDebugMode) {
      print(response.body);
    }
    if (response.body == "false") {
      return Fluttertoast.showToast(
          msg: "Email not found.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepPurpleAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      if (kDebugMode) {
        print(response.body);
      }
      if (kDebugMode) {
        print(response.body);
      }
      //tempPass = json.decode(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ForgotPage2()),
      );
    }
  }

  verifyCode(String code, context) async {
    SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
        context: context, barrierDimisable: false);
    dialog.show(
        message: 'Loading...',
        type: SimpleFontelicoProgressDialogType.normal,
        backgroundColor: Colors.deepPurpleAccent,
        indicatorColor: Colors.white,
        height: 100,
        width: 200,
        textStyle: const TextStyle(color: Colors.white));
    var response = await http
        .post(Uri.parse("https://www.epsilon.net.pk/query.php"), body: {
      "query": "verifyCode",
      "regId": regisIDPass,
      "code": code,
    });
    dialog.hide();
    Navigator.of(context, rootNavigator: true).pop('dialog');
    if (kDebugMode) {
      print(response.body);
    }
    if (response.body == "false") {
      return Fluttertoast.showToast(
          msg: "Verification code is incorrect.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepPurpleAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      if (kDebugMode) {
        print(response.body);
      }
      tempCode = json.decode(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ForgotPage3()),
      );
    }
  }

  changePass(String pass, context) async {
    SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
        context: context, barrierDimisable: false);
    dialog.show(
        message: 'Loading...',
        type: SimpleFontelicoProgressDialogType.normal,
        backgroundColor: Colors.deepPurpleAccent,
        indicatorColor: Colors.white,
        height: 100,
        width: 200,
        textStyle: const TextStyle(color: Colors.white));
    var response = await http
        .post(Uri.parse("https://www.epsilon.net.pk/query.php"), body: {
      "query": "changePassword",
      "regId": regisIDPass,
      "hash": tempCode,
      "newPass": pass
    });
    dialog.hide();
    Navigator.of(context, rootNavigator: true).pop('dialog');
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      Navigator.popUntil(context, ModalRoute.withName('/landing'));
      return Fluttertoast.showToast(
          msg: "Password changed successfully.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepPurpleAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      return Fluttertoast.showToast(
          msg: "Error. Try Again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepPurpleAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  teamData() async {
    var response = await http.post(
        Uri.parse("https://www.epsilon.net.pk/query.php"),
        body: {"query": "teamData", "hash": _hash});
    var data = response.body;
    if (kDebugMode) {
      print(data);
    }
    return json.decode(response.body) as Map<String, dynamic>;
  }

  List<String> barValues = ["Not Applicable"];
  Map<String, String> bardata = {"Not Applicable": "0"};

  barData() async {
    var response = await http
        .post(Uri.parse("https://www.epsilon.net.pk/query.php"), body: {
      "query": "bar",
    });
    //print(json.decode(response.body));
    var data = json.decode(response.body) as List<dynamic>;
    if (kDebugMode) {
      print(data);
    }
    for (var j = 0; j < data.length; j++) {
      barValues.add(data[j]["name"]);
      bardata[data[j]["name"]] = data[j]["id"];
      if (kDebugMode) {
        print(bardata);
      }
    }
  }

  void landApp() {
    _isLanded = true;
    notifyListeners();
  }

  void goToRegister() {
    _goToRegister = true;
    notifyListeners();
  }

  void goBackRegister() {
    _goToRegister = false;
    notifyListeners();
  }

  void goTologin() {
    _goToLogin = true;
    notifyListeners();
  }

  void logout(context) async {
    SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
        context: context, barrierDimisable: false);
    dialog.show(
        message: 'Loading...',
        type: SimpleFontelicoProgressDialogType.normal,
        backgroundColor: Colors.deepPurpleAccent,
        indicatorColor: Colors.white,
        height: 100,
        width: 200,
        textStyle: const TextStyle(color: Colors.white));
    final prefs = await SharedPreferences.getInstance();
    final success = await prefs.remove('hash');
    dialog.hide();
    Navigator.of(context, rootNavigator: true).pop('dialog');
    if (success) {
      _loggedIn = false;
      notifyListeners();
    }
  }

  proofOfpayment(context) async {
    SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
        context: context, barrierDimisable: false);
    dialog.show(
        message: 'Loading...',
        type: SimpleFontelicoProgressDialogType.normal,
        backgroundColor: Colors.deepPurpleAccent,
        indicatorColor: Colors.white,
        height: 100,
        width: 200,
        textStyle: const TextStyle(color: Colors.white));
    var formData = FormData.fromMap({
      'query': 'proofOfPayment',
      'hash': _hash,
      'proofOfPayment': await MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last)
    });
    Dio dio = Dio();
    dio
        .post("https://www.epsilon.net.pk/query.php", data: formData)
        .then((response) {
      dialog.hide();
      Navigator.of(context, rootNavigator: true).pop('dialog');
      if (response.data == "true") {
        setimage(File(''));
        return Fluttertoast.showToast(
            msg:
                "Successful. Your payment status will be updated in a few days.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.deepPurpleAccent,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        return Fluttertoast.showToast(
            msg: response.data,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.deepPurpleAccent,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    setimage(file);
    //return image;
  }

  registerData(context, contxt) async {
    SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
        context: context, barrierDimisable: false);
    List members = [
      {
        'name': _headDelegateName,
        'email': _headEmail,
        'number': _hdPhoneComplete,
        'institution': _headIns == "institute" ? _headInstitution : _headIns
      },
      {
        'name': _member2name,
        'email': _member2email,
        'number': _mem2PhoneComplete,
        'institution': _mem2Ins == "institute" ? _member2institute : _mem2Ins
      },
      {
        'name': _member3name,
        'email': _member3email,
        'number': _mem3PhoneComplete,
        'institution': _mem3Ins == "institute" ? _member3institute : _mem3Ins
      },
      {
        'name': _member4name,
        'email': _member4email,
        'number': _mem4PhoneComplete,
        'institution': _mem4Ins == "institute" ? _member4institute : _mem4Ins
      },
      {
        'name': _member5name,
        'email': _member5email,
        'number': _mem5PhoneComplete,
        'institution': _mem5Ins == "institute" ? _member5institute : _mem5Ins
      },
      {
        'name': _member6name,
        'email': _member6email,
        'number': _mem6PhoneComplete,
        'institution': _mem6Ins == "institute" ? _member6institute : _mem6Ins
      },
      {
        'name': _member7name,
        'email': _member7email,
        'number': _mem7PhoneComplete,
        'institution': _mem7Ins == "institute" ? _member7institute : _mem7Ins
      }
    ];
    List data = [];
    if (member5name.isEmpty || mem5Phone.isEmpty || member5email.isEmpty) {
      data = members.sublist(0, 4);
    } else if (member6name.isEmpty ||
        mem6Phone.isEmpty ||
        member6email.isEmpty) {
      data = members.sublist(0, 5);
    } else if (member7name.isEmpty ||
        mem7Phone.isEmpty ||
        member7email.isEmpty) {
      data = members.sublist(0, 6);
    } else {
      data = members;
    }
    var bar = bardata[_brandName];
    //print(_brandName);
    if (kDebugMode) {
      print(bar);
    }
    if (kDebugMode) {
      print(data);
    }
    dialog.show(
        message: 'Loading...',
        type: SimpleFontelicoProgressDialogType.normal,
        backgroundColor: Colors.deepPurpleAccent,
        indicatorColor: Colors.white,
        height: 100,
        width: 200,
        textStyle: const TextStyle(color: Colors.white));
    var response = await http
        .post(Uri.parse("https://www.epsilon.net.pk/query.php"), body: {
      "query": "register",
      "members": json.encode(data),
      "name": _teamName,
      "password": _passwordAgain,
      "bar": _brandName == "Not Applicable" ? "138" : bar ?? "138",
      "notes": _note,
      "modules": json.encode(_stemmodules)
    });
    dialog.hide();
    Navigator.of(context, rootNavigator: true).pop('dialog');
    //LoadingIndicatorDialog().dismiss();
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisSuccess()),
      );
      //clear();
      _registered = true;
      notifyListeners();
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
      if (kDebugMode) {
        print(_stemmodules);
      }
      Fluttertoast.showToast(
          msg: "fail",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepPurpleAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  clear() {
    _headInstitution = '';
    _headDelegateName = '';
    _headEmail = '';
    _hdPhone = '';
    _hdPhoneComplete = '';
    _mem2Phone = '';
    _mem2PhoneComplete = '';
    _member2name = '';
    _member2email = '';
    _member2institute = '';
    _mem3Phone = '';
    _mem3PhoneComplete = '';
    _member3name = '';
    _member3email = '';
    _member3institute = '';
    _mem4Phone = '';
    _mem4PhoneComplete = '';
    _member4name = '';
    _member4email = '';
    _member4institute = '';
    _mem5Phone = '';
    _mem5PhoneComplete = '';
    _member5name = '';
    _member5email = '';
    _member5institute = '';
    _mem6Phone = '';
    _mem6PhoneComplete = '';
    _member6name = '';
    _member6email = '';
    _member6institute = '';
    _mem7Phone = '';
    _mem7PhoneComplete = '';
    _member7name = '';
    _member7email = '';
    _member7institute = '';
    _stemmodules = [];
    _password = '';
    _passwordAgain = '';
    _teamName = '';
    _note = '';
    _brandName = null;
  }
}
