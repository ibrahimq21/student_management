import 'package:floor/floor.dart';

@entity
class Department {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? department;

  Department({this.id, this.department});

  @override
  String toString() {
    return 'Department{id: $id, department: $department}';
  }
}
