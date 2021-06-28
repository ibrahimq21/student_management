import 'package:flutter/material.dart';
import 'package:student_management/database/app_database.dart';
import 'package:student_management/database_helper.dart';
import 'package:student_management/model/student/students.dart';
import 'package:student_management/screen/detail_students.dart';

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
    print(result);
    return result;
  }

  Widget listTileDemo() {
    return FutureBuilder<List<Student?>>(
      future: fetchAllStudent(),
      builder: (context, snapshot) {
        if (snapshot.hasError || snapshot.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailStudentScreen(
                          student: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        'Name: ${snapshot.data![index]!.name}',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Email: ${snapshot.data![index]!.email}',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Student'),
      ),
      body: listTileDemo(),
    );
  }
}
