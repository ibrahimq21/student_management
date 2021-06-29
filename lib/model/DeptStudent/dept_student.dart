import 'package:floor/floor.dart';
import 'package:student_management/model/department/department.dart';
import 'package:student_management/model/student/students.dart';

@Entity(
  tableName: 'deptStudent',
  foreignKeys: [
    ForeignKey(
        childColumns: ['student_id', 'student_name', 'student_seat'],
        parentColumns: ['id', 'name', 'seat'],
        entity: Student),
    ForeignKey(
      childColumns: ['department_id', 'department'],
      parentColumns: ['id', 'department_name'],
      entity: Department,
    )
  ],
)
class DeptStudent {
  @PrimaryKey(autoGenerate: true)
  int? id;

  @ColumnInfo(name: 'student_id')
  int? student_id;

  @ColumnInfo(name: 'student_name')
  String? student_name;

  @ColumnInfo(name: 'student_seat')
  String? student_seat;

  @ColumnInfo(name: 'department_id')
  int? department_id;

  @ColumnInfo(name: 'department_name')
  String? department_name;

  DeptStudent(
      {this.id, this.department_name, this.student_name, this.student_seat});
}
