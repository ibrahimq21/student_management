import 'package:floor/floor.dart';

@entity
class Student {
  @PrimaryKey(autoGenerate: true)
  int? iD;
  String? name;
  String? gender;
  int? stndClass;
  int? seat;

  Student({
    this.iD,
    this.name,
    this.gender,
    this.stndClass,
    this.seat,
  });

  Student.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    gender = json['Gender'];
    stndClass = json['stnd_class'];
    seat = json['Seat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Gender'] = this.gender;
    data['stnd_class'] = this.stndClass;
    data['Seat'] = this.seat;
    return data;
  }
}
