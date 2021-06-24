import 'package:floor/floor.dart';

@entity
class Student {
  @PrimaryKey(autoGenerate: true)
  int? iD;
  String? name;
  String? email;
  String? password;
  String? gender;
  int? stndClass;
  int? seat;

  Student({
    this.iD,
    this.name,
    this.email,
    this.password,
    this.gender,
    this.stndClass,
    this.seat,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['Gender'] = this.gender;
    data['stnd_class'] = this.stndClass;
    data['Seat'] = this.seat;
    return data;
  }
}
