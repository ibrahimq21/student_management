import 'package:flutter/material.dart';
import 'package:student_management/database/app_database.dart';
import 'package:student_management/database_helper.dart';
import 'package:student_management/model/department/department.dart';
import 'package:student_management/size_helper.dart';

class AddDeptScreen extends StatefulWidget {
  const AddDeptScreen({Key? key}) : super(key: key);

  @override
  _AddDeptScreenState createState() => _AddDeptScreenState();
}

class _AddDeptScreenState extends State<AddDeptScreen> {
  final _formKey = GlobalKey<FormState>();

  final _departmentController = TextEditingController();

  AppDatabase? database;

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
        title: Text('Add Department'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              height: displayHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0, top: 18.0),
                    child: TextFormField(
                      controller: _departmentController,
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
                        labelText: 'Enter your Department',
                      ),
                    ),
                  ),
                  FlatButton(
                    minWidth: displayWidth(context) * 0.3,
                    height: displayHeight(context) * 0.1,
                    color: Color(0xff1F8976),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final department = Department(
                            department: _departmentController.value.text);
                        await database!.deptDao
                            .insertDept(department)
                            .then((value) async {
                          final result = await database!.deptDao.fetchAllDept();
                          print(result);
                        });
                      }
                    },
                    child: Center(
                      child: Text(
                        'Add Department',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder<List<Department?>>(
                    future: database!.deptDao.fetchAllDept(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text('ID: ${snapshot.data![index]!.id}'),
                            title: Text(
                                'Department: ${snapshot.data![index]!.department}'),
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
      ),
    );
  }
}
