import 'package:app/data/model/local/db_advice.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  final _databaseName = "advice_list.db";
  final _databaseVersion = 1;

  // make this singleton class
  DBProvider._();

  static final DBProvider instance = DBProvider._();

  // only have a single app-wide reference to the database
  Database? _database;

  Future<Database> get database async {
    // lazily instantate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  void _createTableV1(Batch batch) {
    batch.execute(DBAdvice.createTable);
  }

  //this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        var batch = db.batch();
        _createTableV1(batch);
        await batch.commit();
      },
      onDowngrade: onDatabaseDowngradeDelete,
    );
  }
}
