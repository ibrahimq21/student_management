import 'package:student_management/model/student/students.dart';
import 'package:floor/floor.dart';

@dao
abstract class StndDao {
  @Query('Select * from Student')
  Future<List<Student?>> fetchAllStnd();

  @Query('SELECT * FROM Student WHERE id = :id')
  Future<Student?> findStndById(int id);

  @Query(
      'Update Student SET name =:name, email =:email, password =:password, gender =:gender1 where iD = :iD')
  Future<void> updateStudent(
      String name, String email, String password, String gender1, int iD);

  @Query('DELETE FROM Student Where id = :id')
  Future<Student?> deleteStudent(int id);

  @insert
  Future<void> insertStnd(Student stnd);
}
