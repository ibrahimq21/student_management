import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_management/database/app_database.dart';
import 'package:student_management/database_helper.dart';
import 'package:student_management/model/student/students.dart';
import 'package:student_management/size_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String errorMessage = '';

  String pwdMessage = '';
  final adminUser = {
    'username': 'admin',
    'password': 'admin',
  };
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  late AppDatabase database;

  // late List<Student?> stndList;

  @override
  void initState() {
    //Todo implement here

    super.initState();
  }

  Future<List<Student?>> loginDemo() async {
    final database = await getDatabase();
    final stndDao = database.stndDao;

    print("is it working?");
    final result = await stndDao.fetchAllStnd();
    // print(result);
    return result;
  }

  void checkInput({String? username, String? password}) {
    if (adminUser['username'] == username &&
        adminUser['password'] == password) {
      Navigator.pushNamed(context, '/DashboardScreen');
    } else {
      loginDemo().then((value) {
        for (int i = 0; i < value.length; i++) {
          if (value.elementAt(i)!.email == username) {
            if (value.elementAt(i)!.password == password) {
              Navigator.pushNamed(context, '/StndDashboardScreen');
            } else {
              setState(() {
                errorMessage = 'Password is Wrong!';
              });
            }
          } else {
            setState(() {
              errorMessage = 'Student Not found!';
            });
          }
        }
      });
    }
  }

  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Container(
            width: displayWidth(context),
            height: displayHeight(context),
            padding: const EdgeInsets.all(10.0),
            color: Colors.deepOrangeAccent,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: displayWidth(context) * 0.3,
                    height: displayHeight(context) * 0.3,
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Image(
                      image: AssetImage('assets/image/logo.png'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            'Username',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.emailAddress,
                          onEditingComplete: () => node.nextFocus(),
                          validator: (value) =>
                              value!.isEmpty ? '*Required' : null,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: 'Enter your username',
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            'Password',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) =>
                              value!.isEmpty ? '*Required' : null,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          obscureText: _visible,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: 'Enter your password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_visible == true) {
                                    _visible = false;
                                  } else if (_visible == false) {
                                    _visible = true;
                                  }
                                });
                              },
                              child: _visible
                                  ? Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      Icons.panorama_fish_eye,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        Text('$errorMessage',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 18.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 60.0),
                          child: FlatButton(
                            minWidth: displayWidth(context) * 0.5,
                            height: displayHeight(context) * 0.08,
                            color: const Color(0xff2d336d),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                checkInput(
                                    username: _usernameController.value.text,
                                    password: _passwordController.value.text);
                              }

                              // Navigator.pushReplacementNamed(
                              //     context, '/DashboardScreen');
                            },
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/SignupScreen');
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 60.0, top: 30.0),
                            child: Text(
                              'Are u a student. Sign Up here then!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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
