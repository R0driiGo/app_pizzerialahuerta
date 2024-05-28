import 'package:app_pizzerialahuerta/utils/usuario.dart';
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

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'appPizzeria.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<Usuario?> getUserByEmailAndPassword(String email, String password) async {
    Database db = await database;
    List<Map<String, dynamic>> users = await db.query(
      'usuarios',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (users.isNotEmpty) {
      // Si se encuentra un usuario, crea un objeto Usuario y devuélvelo
      return Usuario(
        nombre: users[0]['firstName'],
        apellidos: users[0]['lastName'],
        correo: users[0]['email'],
        contrasena: users[0]['password'],
      );
    } else {
      // Si no se encuentra ningún usuario, devuelve null
      return null;
    }
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        firstName TEXT NOT NULL,
        lastName TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await database;
    return await db.insert('usuarios', user);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await database;
    return await db.query('usuarios');
  }
}