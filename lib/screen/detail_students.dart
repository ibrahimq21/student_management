import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_management/model/student/students.dart';

class DetailStudentScreen extends StatefulWidget {
  final Student? student;

  const DetailStudentScreen({Key? key, required this.student})
      : super(key: key);

  @override
  _DetailStudentScreenState createState() => _DetailStudentScreenState();
}

class _DetailStudentScreenState extends State<DetailStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Student Details')),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${widget.student!.name}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text('Email: ${widget.student!.email}',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text('Password: ${widget.student!.password}',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text('Class: ${widget.student!.stndClass}',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text('Seat No: ${widget.student!.seat}',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
