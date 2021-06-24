import 'package:flutter/material.dart';

class DisplayStndScreen extends StatefulWidget {
  const DisplayStndScreen({Key? key}) : super(key: key);

  @override
  _DisplayStndScreenState createState() => _DisplayStndScreenState();
}

class _DisplayStndScreenState extends State<DisplayStndScreen> {
  Widget displayTable() {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Name',
          ),
        ),
        DataColumn(
          label: Text(
            'Age',
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Mohit')),
            DataCell(Text('23')),
            DataCell(Text('Professional')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Aditya')),
            DataCell(Text('24')),
            DataCell(Text('Associate Professor')),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Display Student'),
        ),
        body: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Class',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Department',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Mohit')),
                DataCell(Text('23')),
                DataCell(Text('6')),
                DataCell(Text('Computer Science')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Akshay')),
                DataCell(Text('25')),
                DataCell(Text('7')),
                DataCell(Text('Computer Science')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Deepak')),
                DataCell(Text('29')),
                DataCell(Text('8 ')),
                DataCell(Text('Computer Science')),
              ],
            ),
          ],
        ));
  }
}
