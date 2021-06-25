import 'package:student_management/database/app_database.dart';

Future<AppDatabase> getDatabase() async {
  return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}
