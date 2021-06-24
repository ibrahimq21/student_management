import 'package:flutter/material.dart';
import 'package:student_management/size_helper.dart';

class AddDeptScreen extends StatefulWidget {
  const AddDeptScreen({Key? key}) : super(key: key);

  @override
  _AddDeptScreenState createState() => _AddDeptScreenState();
}

class _AddDeptScreenState extends State<AddDeptScreen> {
  final _departmentController = TextEditingController();

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
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/DashboardScreen');
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
          ],
        ),
      ),
    );
  }
}
