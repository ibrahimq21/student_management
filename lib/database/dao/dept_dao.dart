import 'package:floor/floor.dart';
import 'package:student_management/model/department/department.dart';

@dao
abstract class DeptDao {
  @Query('Select * from Department')
  Future<List<Department?>> fetchAllDept();

  @Query('SELECT * FROM Department WHERE id = :id')
  Future<Department?> findDeptById(int id);

  @delete
  Future<void> deleteDepartment(Department dept);

  @update
  Future<void> updateDepartment(Department dept);

  @insert
  Future<void> insertDept(Department dept);
}
