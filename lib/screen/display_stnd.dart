import 'package:flutter/material.dart';

class DisplayStndScreen extends StatefulWidget {
  const DisplayStndScreen({Key? key}) : super(key: key);

  @override
  _DisplayStndScreenState createState() => _DisplayStndScreenState();
}

class _DisplayStndScreenState extends State<DisplayStndScreen> {
  Widget displayTable() {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Display Student'),
        ),
        body: Container(
          child: Column(),
        ),
      ),
    );
  }
}
