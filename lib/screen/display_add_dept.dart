import 'package:flutter/material.dart';
import 'package:student_management/database_helper.dart';

import 'package:student_management/model/department/department.dart';
import 'package:student_management/model/student/students.dart';

class DisplayAddDept extends StatefulWidget {
  final Student? student;
  const DisplayAddDept({Key? key, required this.student}) : super(key: key);

  @override
  _DisplayAddDeptState createState() => _DisplayAddDeptState();
}

class _DisplayAddDeptState extends State<DisplayAddDept> {
  Future<List<Department?>> fetchAllDepartment() async {
    final database = await getDatabase();
    final deptDao = database.deptDao;
    final result = await deptDao.fetchAllDept();
    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> addDepartmentToStudent({required int? deptId}) async {
    print("iddddddddddddddd : $deptId");

    final database = await getDatabase();
    final dao = database.stndDao;
    final deptStudent = Student(
      id: widget.student!.id,
      name: widget.student!.name,
      email: widget.student!.email,
      gender: widget.student!.gender,
      seat: widget.student!.seat,
      password: widget.student!.password,
      stndClass: widget.student!.stndClass,
      deptId: deptId,
    );

    print("updateddd : ${await dao.updateStnd(deptStudent)}");
    final result = await dao.fetchAllStnd();
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/DisplayStndScreen');
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('Add Dept'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<List<Department?>>(
                  future: fetchAllDepartment(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            addDepartmentToStudent(
                                deptId: snapshot.data![index]!.id);
                            print(snapshot.data![index]!.id);
                          },
                          child: ListTile(
                            title: Text('${snapshot.data![index]!.department}'),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
