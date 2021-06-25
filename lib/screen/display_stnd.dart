import 'package:flutter/material.dart';
import 'package:student_management/database/app_database.dart';
import 'package:student_management/database_helper.dart';
import 'package:student_management/model/student/students.dart';
import 'package:student_management/service/service.dart';

class DisplayStndScreen extends StatefulWidget {
  const DisplayStndScreen({Key? key}) : super(key: key);

  @override
  _DisplayStndScreenState createState() => _DisplayStndScreenState();
}

class _DisplayStndScreenState extends State<DisplayStndScreen> {
  late AppDatabase database;

  @override
  void initState() {
    // TODO: implement initState
    getDatabase().then((value) async {
      this.database = value;
    });
    super.initState();
  }

  Future<List<Student?>> fetchAllStudent() async {
    final database = await getDatabase();
    final studentDao = database.stndDao;
    final result = await studentDao.fetchAllStnd();
    return result;
  }

  Widget displayTable() {
    return FutureBuilder<List<Student?>>(
      future: fetchAllStudent(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return CircularProgressIndicator();
        }
        return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Name',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Email',
                    ),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('${snapshot.data![index]!.name}')),
                      DataCell(Text('${snapshot.data![index]!.email}')),
                    ],
                  ),
                ],
              );
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Student'),
      ),
      body: displayTable(),
    );
  }
}
