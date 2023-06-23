import 'package:flutter/material.dart';
import 'package:myapp/Comm/genLoginSignupHeader.dart';
import 'package:myapp/Comm/genToast.dart';
import 'package:myapp/Models/UserModel.dart';
import 'package:myapp/dbHandler/dbHelper.dart';
import 'package:myapp/ekrany/login.dart';
import 'package:myapp/Comm/genTextFormField.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = new GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conName = TextEditingController();
  final _conSurname = TextEditingController();
  final _conPassword = TextEditingController();
  final _conEmail = TextEditingController();
  final _conCPassword = TextEditingController();
  final _conPhone = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  signUp() async {
    String uid = _conUserId.text;
    String name = _conName.text;
    String cpassword = _conCPassword.text;
    String surname = _conSurname.text;
    String password = _conPassword.text;
    String email = _conEmail.text;
    String phone = _conPhone.text;

    if (_formKey.currentState!.validate()) {
      if (password != cpassword) {
        alertToast(context, 'Hasła Do Siebie Nie Pasują');
      } else {
        _formKey.currentState?.save();

        UserModel uModel =
            UserModel(uid, name, surname, password, email, phone);

        await dbHelper.saveData(uModel).then((userData) {
          alertToast(context, 'Pomyślnie Utworzono Konto');

          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginForm()));
        }).catchError((error) {
          // ignore: avoid_print
          print(error);
          alertToast(context, 'Nie Udało Się Utworzyć Konta');
        });
      }
    }

    // if (uid.isEmpty) {
    //  alertToast(context, 'Proszę Wprowadzić Nazwę Użytkownika');
    // } else if (password.isEmpty) {
    //  alertToast(context, 'Proszę Wprowadzić Hasło');
    // } else if (cpassword.isEmpty) {
    //  alertToast(context, 'Proszę Potwierdzić Hasło');
    //} else if (name.isEmpty) {
    //  alertToast(context, 'Proszę Wprowadzić Imię');
    // } else if (surname.isEmpty) {
    //  alertToast(context, 'Proszę Wprowadzić Nazwisko');
    //} else if (email.isEmpty) {
    //  alertToast(context, 'Proszę Wprowadzić Adres Email');
    //} else if (phone.isEmpty) {
    // alertToast(context, 'Proszę Wprowadzić Numer Telefonu');
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Rejestracja'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  genLogSignHeader(
                    headerText: 'Poniżej wprowadź dane do zarejstrowania się',
                  ),
                  genTextFormField(
                    controller: _conUserId,
                    hintName: 'Nazwa użytkownika',
                    inputType: TextInputType.name,
                    icon: Icons.person,
                  ),
                  genTextFormField(
                    controller: _conPassword,
                    hintName: 'Hasło',
                    icon: Icons.lock,
                    isObscureText: true,
                  ),
                  genTextFormField(
                    controller: _conCPassword,
                    hintName: 'Potwierdź Hasło',
                    icon: Icons.lock_outlined,
                    isObscureText: true,
                  ),
                  genTextFormField(
                    controller: _conName,
                    hintName: 'Imie',
                    icon: Icons.arrow_circle_right_outlined,
                  ),
                  genTextFormField(
                    controller: _conSurname,
                    hintName: 'Nazwisko',
                    icon: Icons.arrow_circle_right_outlined,
                  ),
                  genTextFormField(
                    controller: _conEmail,
                    hintName: 'Adres Email',
                    inputType: TextInputType.emailAddress,
                    icon: Icons.alternate_email,
                  ),
                  genTextFormField(
                    controller: _conPhone,
                    hintName: 'Numer Telefonu',
                    icon: Icons.add_ic_call_outlined,
                  ),
                  Container(
                    margin: const EdgeInsets.all(30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      child: const Text('Zarejestruj się',
                          style: TextStyle(color: Colors.black)),
                      onPressed: signUp,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Posiadasz już konto?'),
                        TextButton(
                          child: const Text(
                            'Zaloguj się',
                            style: TextStyle(color: Colors.amberAccent),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const LoginForm()),
                                (Route<dynamic> route) => false);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
