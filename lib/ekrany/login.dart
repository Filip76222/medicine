import 'package:flutter/material.dart';
import 'package:myapp/Comm/genLoginSignupHeader.dart';
import 'package:myapp/Comm/genTextFormField.dart';
import 'package:myapp/Comm/genToast.dart';
//import 'package:myapp/Models/UserModel.dart';
import 'package:myapp/dbHandler/dbHelper.dart';
import 'package:myapp/ekrany/homeFront.dart';
import 'package:myapp/ekrany/registration.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //Future<SharedPreferences> _pref = SharedPreferences.getInstancce();
  //final _formKey = new GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String userId = _conUserId.text;
    String password = _conPassword.text;

    if (userId.isEmpty) {
      alertToast(context, 'Proszę Wprowadzić Nazwę użytkownika');
    } else if (password.isEmpty) {
      alertToast(context, 'Proszę Wprowadzić Hasło');
    } else {
      await dbHelper.getLoginUser(userId, password).then((userData) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => homeFront()),
            (Route<dynamic> route) => false);
      }).catchError((error) {
        print(error);
        alertToast(context, 'Użytkownik Nie Istnieje');
      });
    }
  }

  // login() async {
  //   String uid = _conUserId.text;
  //   String password = _conPassword.text;
//
  //   if (uid.isEmpty) {
  //     alertToast(context, 'Proszę Wprowadzić Nazwę użytkownika');
  //   } else if (password.isEmpty) {
  //     alertToast(context, 'Proszę Wprowadzić Hasło');
  //   } else {
  //     await dbHelper.getLoginUser(uid, password).then((userData) {
  //       if (userData != null) {
  //         setSP(userData).whenComplete(() {
  //           Navigator.pushAndRemoveUntil(
  //               context,
  //               MaterialPageRoute(builder: (_) => homeFront()),
  //               (Route<dynamic> route) => false);
  //         });
  //       } else {
  //         alertToast(context, "Użytkownik Nie Istnieje");
  //       }
  //     }).catchError((error) {
  //       // ignore: avoid_print
  //       print(error);
  //       alertToast(context, 'Nie Udało Się Zalogować');
  //     });
  //   }
  // }

  //Future setSP(UserModel user) async {
  //final SharedPreferences sp = await _pref;

  //sp.setString("user_id", user.user_id);
  //sp.setString("name", user.name);
  //sp.setString()
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Logowanie'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genLogSignHeader(
                  headerText: 'Poniżej wprowadź dane do zalogowania się',
                ),
                genTextFormField(
                  controller: _conUserId,
                  hintName: 'Nazwa Użytkownika',
                  icon: Icons.person,
                ),
                genTextFormField(
                  controller: _conPassword,
                  hintName: 'Hasło',
                  icon: Icons.lock,
                  isObscureText: true,
                ),
                Container(
                  margin: const EdgeInsets.all(30),
                  width: double.infinity,
                  child: TextButton(
                    child: Text('Zaloguj się',
                        style: TextStyle(color: Colors.black)),
                    onPressed: login,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Center(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Nie masz konta?'),
                        TextButton(
                          child: Text(
                            'Zarejestruj się',
                            style: TextStyle(color: Colors.amberAccent),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SignupForm()));
                          },
                        ),
                      ],
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
