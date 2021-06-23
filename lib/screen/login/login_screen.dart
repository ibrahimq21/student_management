import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_management/size_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 140.0),
                    width: displayWidth(context) * 0.4,
                    height: displayHeight(context) * 0.1,
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Image(
                      image: AssetImage('assets/image/logo.png'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
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
                        Text(
                          'Password',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
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
                        Container(
                          child: FlatButton(
                            minWidth: displayWidth(context) * 0.5,
                            height: displayHeight(context) * 0.08,
                            color: const Color(0xff2d336d),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/DashboardScreen');
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
