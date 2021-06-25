import 'dart:async';

import 'package:floor/floor.dart';
import 'package:student_management/database/dao/dept_dao.dart';
import 'package:student_management/database/dao/student_dao.dart';
import 'package:student_management/model/department/department.dart';
import 'package:student_management/model/student/students.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Student, Department])
abstract class AppDatabase extends FloorDatabase {
  StndDao get stndDao;
  DeptDao get deptDao;
}
