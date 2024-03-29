import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_management/database/app_database.dart';
import 'package:student_management/database_helper.dart';
import 'package:student_management/model/student/students.dart';
import 'package:student_management/size_helper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _genderController = TextEditingController();
  final _stndClass = TextEditingController();
  final _seatController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late AppDatabase database;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatabase().then((value) async {
      this.database = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Student Signup'),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.deepOrange,
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0, top: 18.0),
                  child: TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    onEditingComplete: () => node.nextFocus(),
                    validator: (value) => value!.isEmpty ? '*Required' : null,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Enter your name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0, top: 18.0),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    onEditingComplete: () => node.nextFocus(),
                    validator: (value) => value!.isEmpty ? '*Required' : null,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Enter your email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0, top: 18.0),
                  child: TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    onEditingComplete: () => node.nextFocus(),
                    validator: (value) => value!.isEmpty ? '*Required' : null,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Enter your password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0, top: 18.0),
                  child: TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    onEditingComplete: () => node.nextFocus(),
                    validator: (value) => value!.isEmpty ? '*Required' : null,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Confirm Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0, top: 18.0),
                  child: TextFormField(
                    controller: _genderController,
                    keyboardType: TextInputType.name,
                    onEditingComplete: () => node.nextFocus(),
                    validator: (value) => value!.isEmpty ? '*Required' : null,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Enter your gender',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0, top: 18.0),
                  child: TextFormField(
                    controller: _stndClass,
                    keyboardType: TextInputType.name,
                    onEditingComplete: () => node.nextFocus(),
                    validator: (value) => value!.isEmpty ? '*Required' : null,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Enter Your Class'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0, top: 18.0),
                  child: TextFormField(
                    controller: _seatController,
                    keyboardType: TextInputType.name,
                    onEditingComplete: () => node.nextFocus(),
                    validator: (value) => value!.isEmpty ? '*Required' : null,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Enter your seat',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: FlatButton(
                    minWidth: displayWidth(context) * 0.5,
                    height: displayHeight(context) * 0.08,
                    color: const Color(0xff2d336d),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final student = Student(
                            email: _emailController.value.text,
                            gender: _genderController.value.text,
                            name: _nameController.value.text,
                            password: _passwordController.value.text,
                            seat: int.parse(_seatController.value.text),
                            stndClass: int.parse(_stndClass.value.text));

                        await database.stndDao
                            .insertStnd(student)
                            .then((value) async {
                          final result = await database.stndDao.fetchAllStnd();
                          print("Result" + result.toString());
                        });

                        Navigator.pushReplacementNamed(
                            context, '/StndDashboardScreen');
                      }
                    },
                    child: Text(
                      'Register',
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
        ),
      ),
    );
  }
}
