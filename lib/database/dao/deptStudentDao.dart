import 'package:floor/floor.dart';
import 'package:student_management/model/DeptStudent/dept_student.dart';

@dao
abstract class DeptStudentDao {
  @Query('Select * from deptStudent')
  Future<List<DeptStudent?>> fetchAllData();

  @insert
  Future<void> insertDeptStudent(DeptStudent deptStudent);

  @delete
  Future<void> deleteDeptStudent(DeptStudent deptStudent);
}
