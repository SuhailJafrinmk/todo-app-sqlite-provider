import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_provider/models/todo_model.dart';

class DbHelper{
  DbHelper._();
  static final DbHelper dbHelper=DbHelper._();
  static DbHelper get instance=>dbHelper;
  late Database _database;
  Future<Database> get database async{
    if(_database!=null)return _database;
    _database=await initDataBase();
    return _database;
  }
  static Future<Database>initDataBase()async{
    String path=join(await getDatabasesPath(),'todo_database.db');
    return openDatabase(path,version: 1,onCreate: (db, version)async{
      await _createTodosTable(db);
    },);
  }
  static Future<void> _createTodosTable(Database db) async {
    await db.execute('''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        createdAt INTEGER,
        updatedDate INTEGER,
        remindDate INTEGER
      )
    '''
);
  }
  static Future<void>deleteDb()async{
    String path=join(await getDatabasesPath(),'todo_database.db');
    deleteDatabase(path);
  }
  static Future<void> addTodo(Database db, TodoModel todoModel) async {
    await db.execute('''
      INSERT INTO todos (title, description, createdAt, updatedDate, remindDate) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      todoModel.title,
      todoModel.description ?? null,
      todoModel.createdAt,
      todoModel.updatedAt,
      todoModel.reminder ?? null,
    ]);
  }
}