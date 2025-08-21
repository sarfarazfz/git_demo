import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// how to use?
// Database db = Get.find();
class ServiceDb extends GetxService {

  Future<Database> createDbObject() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'shafik.db');
    Database db = await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) {
          db.execute(
            "CREATE TABLE user (uid INTEGER PRIMARY KEY AUTOINCREMENT, first_name TEXT, last_name TEXT, dob TEXT)",
          );
        },
      ),
    );
    return db;
  }
}
