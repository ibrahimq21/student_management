import 'package:student_management/model/student/students.dart';
import 'package:floor/floor.dart';

@dao
abstract class StndDao {
  @Query('Select * from Student')
  Future<List<Student?>> fetchAllStnd();

  @Query('SELECT * FROM Student WHERE id = :id')
  Future<Student?> findStndById(int id);

  @update
  Future<void> updateStnd(Student? student);

  @delete
  Future<void> deleteStnd(Student? student);

  @insert
  Future<void> insertStnd(Student? stnd);
}
