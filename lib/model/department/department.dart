import 'package:floor/floor.dart';

@Entity(primaryKeys: ['department'])
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
