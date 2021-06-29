import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_management/database_helper.dart';
import 'package:student_management/model/student/students.dart';
import 'package:student_management/screen/edit_stnd_screen.dart';

class DetailStudentScreen extends StatefulWidget {
  final Student? student;

  const DetailStudentScreen({Key? key, required this.student})
      : super(key: key);

  @override
  _DetailStudentScreenState createState() => _DetailStudentScreenState();
}

class _DetailStudentScreenState extends State<DetailStudentScreen> {
  Future<void> deleteStudent({Student? student}) async {
    final database = await getDatabase();
    final stndDao = database.stndDao;
    await stndDao.deleteStnd(student);
    final result = await stndDao.fetchAllStnd();
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/DashboardScreen');
            },
            child: Icon(Icons.arrow_back)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditStudentScreen(
                              student: widget.student,
                            ),
                          ),
                        );
                      },
                      child: Text('Update')),
                  ElevatedButton(
                      onPressed: () {}, child: Text('Add Department')),
                  ElevatedButton(
                    onPressed: () {
                      deleteStudent(student: widget.student);
                      Navigator.pop(context);
                    },
                    child: Text('Delete'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color?>(Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
