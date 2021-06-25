import 'package:student_management/database_helper.dart';
import 'package:student_management/model/student/students.dart';

class ServiceAPI {
  Future<List<Student?>> fetchAllStudent() async {
    final database = await getDatabase();
    final studentDao = database.stndDao;
    final result = await studentDao.fetchAllStnd();
    return result;
  }

  Future<void> insertStudent({Student? student}) async {
    final database = await getDatabase();
    final studentDao = database.stndDao;
    await studentDao.insertStnd(student!);
  }

  Future<void> deleteStudentById({required int id}) async {
    final database = await getDatabase();
    final studentDao = database.stndDao;
    await studentDao.deleteStudent(id);
  }
}
