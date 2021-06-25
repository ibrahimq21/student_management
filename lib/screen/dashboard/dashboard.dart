import 'package:flutter/material.dart';
import 'package:student_management/size_helper.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final double height = 18.0;
  final double left = 20.0;
  final double right = 20.0;

  final Color white = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Dashboard',
            style: TextStyle(
              color: white,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 19.0, right: 19.0),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlatButton(
              minWidth: displayWidth(context) * 0.3,
              height: displayHeight(context) * 0.1,
              color: Color(0xff33828D),
              onPressed: () {
                Navigator.of(context).pushNamed('/DisplayStndScreen');
              },
              child: Center(
                child: Text(
                  'Display Stnd',
                  style: TextStyle(
                    color: white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height,
            ),
            FlatButton(
              minWidth: displayWidth(context) * 0.3,
              height: displayHeight(context) * 0.1,
              color: Color(0xff1F8976),
              onPressed: () {
                Navigator.of(context).pushNamed('/AddDeptScreen');
              },
              child: Center(
                child: Text(
                  'Add Department',
                  style: TextStyle(
                    color: white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height,
            ),
            FlatButton(
              minWidth: displayWidth(context) * 0.3,
              height: displayHeight(context) * 0.1,
              color: Color(0xff135e8d),
              onPressed: () {},
              child: Center(
                child: Text(
                  'Edit Stnd',
                  style: TextStyle(
                    color: white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height,
            ),
            FlatButton(
              minWidth: displayWidth(context) * 0.3,
              height: displayHeight(context) * 0.1,
              color: Color(0xff1a8fd4),
              onPressed: () {},
              child: Center(
                child: Text(
                  'Edit Department',
                  style: TextStyle(
                    color: white,
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
