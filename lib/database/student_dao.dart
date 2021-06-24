import 'package:student_management/model/student/students.dart';
import 'package:floor/floor.dart';

@dao
abstract class StndDao {
  @Query('Select * from Student')
  Future<List<Student?>> fetchAllStnd();

  @Query('SELECT * FROM Student WHERE id = :id')
  Future<Student?> findStndById(int id);

  @insert
  Future<void> insertStnd(Student stnd);
}
