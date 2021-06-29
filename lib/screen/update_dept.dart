import 'package:flutter/material.dart';
import 'package:student_management/database_helper.dart';
import 'package:student_management/model/department/department.dart';

class UpdateDepartmentScreen extends StatefulWidget {
  final Department department;
  const UpdateDepartmentScreen({Key? key, required this.department})
      : super(key: key);

  @override
  _UpdateDepartmentScreenState createState() => _UpdateDepartmentScreenState();
}

class _UpdateDepartmentScreenState extends State<UpdateDepartmentScreen> {
  final _editDepartmentController = TextEditingController();

  Future<void> updateDept(Department dept) async {
    final database = await getDatabase();
    final deptDao = database.deptDao;
    await deptDao.updateDepartment(dept);
    final result = await deptDao.fetchAllDept();
    print(result);
  }

  Future<void> deleteDept(Department dept) async {
    final database = await getDatabase();
    final deptDao = database.deptDao;
    await deptDao.deleteDepartment(dept);
    final result = await deptDao.fetchAllDept();
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Department'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _editDepartmentController,
                keyboardType: TextInputType.name,
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
                  labelText: 'Enter New Department',
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        final department = Department(
                            department: _editDepartmentController.value.text);
                        updateDept(department);
                      },
                      child: Text('Update')),
                  ElevatedButton(
                      onPressed: () {
                        deleteDept(widget.department);
                        Navigator.pop(context);
                      },
                      child: Text('Delete')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
