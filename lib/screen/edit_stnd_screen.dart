import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_management/database_helper.dart';
import 'package:student_management/model/student/students.dart';

class EditStudentScreen extends StatefulWidget {
  final Student? student;

  const EditStudentScreen({Key? key, required this.student}) : super(key: key);

  @override
  _EditStudentScreenState createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  var _nameController = TextEditingController();
  final _genderController = TextEditingController();
  final _stndClass = TextEditingController();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> updateStudent({Student? student}) async {
    final database = await getDatabase();
    final stndDao = database.stndDao;
    await stndDao.updateStnd(student);
    final result = await stndDao.fetchAllStnd();
    print(result);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = '${widget.student!.name}';
    _emailController.text = '${widget.student!.email}';
    _passwordController.text = '${widget.student!.password}';
    _genderController.text = '${widget.student!.gender}';
    _stndClass.text = '${widget.student!.seat}';
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Student Edit')),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        labelText: 'Enter New name',
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
                        labelText: 'Enter New email',
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
                        labelText: 'Enter New password',
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
                        labelText: 'Enter New gender',
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
                          labelText: 'Enter New Class'),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final updateStnd = Student(
                              id: widget.student!.id,
                              name: _nameController.value.text,
                              email: _emailController.value.text,
                              password: _passwordController.value.text,
                              gender: _genderController.value.text,
                              stndClass: int.parse(_stndClass.value.text));
                          updateStudent(student: updateStnd);
                          Navigator.pushReplacementNamed(
                              context, '/DisplayStndScreen');
                        },
                        child: Text('Update Student'),
                      ),
                    ],
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
