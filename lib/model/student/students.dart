import 'package:floor/floor.dart';

@entity
class Student {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? name;
  String? email;
  String? password;
  String? gender;
  int? stndClass;
  int? seat;

  Student({
    this.id,
    this.name,
    this.email,
    this.password,
    this.gender,
    this.stndClass,
    this.seat,
  });

  @override
  String toString() {
    return 'Student{id: $id, name: $name, email: $email, password: $password, gender: $gender, stndClass: $stndClass, seat: $seat}';
  }
}
