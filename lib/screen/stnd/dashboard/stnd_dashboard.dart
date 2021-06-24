import 'package:flutter/material.dart';
import 'package:student_management/size_helper.dart';

class StndDashboardScreen extends StatefulWidget {
  const StndDashboardScreen({Key? key}) : super(key: key);

  @override
  _StndDashboardScreenState createState() => _StndDashboardScreenState();
}

class _StndDashboardScreenState extends State<StndDashboardScreen> {
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
            SizedBox(
              height: height,
            ),
            FlatButton(
              minWidth: displayWidth(context) * 0.3,
              height: displayHeight(context) * 0.1,
              color: Color(0xff1F8976),
              onPressed: () {
                Navigator.pushNamed(context, '/EditScreen');
              },
              child: Center(
                child: Text(
                  'Edit Account',
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
