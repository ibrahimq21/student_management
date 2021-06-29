import 'package:flutter/material.dart';
import 'package:student_management/model/student/students.dart';

class DisplayAddDept extends StatefulWidget {
  final Student student;
  const DisplayAddDept({Key? key, required this.student}) : super(key: key);

  @override
  _DisplayAddDeptState createState() => _DisplayAddDeptState();
}

class _DisplayAddDeptState extends State<DisplayAddDept> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/DisplayStndScreen');
            },
            child: Icon(Icons.arrow_back)),
        title: Text('Add Dept'),
      ),
    );
  }
}
