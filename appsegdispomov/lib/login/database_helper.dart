import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }
<<<<<<< HEAD
  Future<int> registerUser(String username, String password, String profilePictureUrl) async {
  final db = await database;
  var res = await db.insert("User", {
    'username': username,
    'password': password,
    'profilePictureUrl': profilePictureUrl,
  });
  return res;
}
=======
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'securemobile.db');
    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE users(
<<<<<<< HEAD
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  username TEXT NOT NULL, 
  email TEXT NOT NULL UNIQUE, 
  password TEXT NOT NULL,
  profilePictureUrl TEXT
)

=======
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            username TEXT NOT NULL, 
            email TEXT NOT NULL UNIQUE, 
            password TEXT NOT NULL
          )
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6
          '''
        );
      },
      version: 1,
    );
  }

  Future<void> insertUser(String username, String email, String password) async {
    final db = await database;
    try {
      await db.insert(
        'users',
        {
          'username': username,
          'email': email,
          'password': password
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Error al insertar el usuario: $e');
    }
  }

<<<<<<< HEAD
  Future<Map<String, dynamic>?> getUser(String identifier, String password) async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query(
    'users',
    where: "(email = ? OR username = ?) AND password = ?",
    whereArgs: [identifier, identifier, password],
  );
  if (maps.isNotEmpty) {
    return maps.first;
  }
  return null;
=======
  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: "email = ? AND password = ?",
      whereArgs: [email, password],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6
  }
}
