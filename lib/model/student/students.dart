import 'package:floor/floor.dart';
import 'package:student_management/model/department/department.dart';

@Entity(foreignKeys: [
  ForeignKey(
      childColumns: ['dept_id'], parentColumns: ['id'], entity: Department)
])
class Student {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? name;
  String? email;
  String? password;
  String? gender;
  int? stndClass;
  int? seat;
  @ColumnInfo(name: 'dept_id')
  int? deptId;

  Student({
    this.id,
    this.name,
    this.email,
    this.password,
    this.gender,
    this.stndClass,
    this.seat,
    this.deptId,
  });

  @override
  String toString() {
    return 'Student{id: $id, name: $name, email: $email, password: $password, gender: $gender, stndClass: $stndClass, seat: $seat, deptID: $deptId';
  }
}
