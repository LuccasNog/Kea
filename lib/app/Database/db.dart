// Configuração de arbertura e operação de tabelas

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  // Constructor com acesso privado ou seja que somente uma instancia seja criada
  DB._();

  //Criando uma instancia de DB
  static final DB instance = DB._();

  //Criando a instancia do SQLITE
  static Database? _database;

  //Criando método do tipo GET
  // vai verificar o db é diferente de null, ele vai retornar o próp´rio database.

  get database async {
    if (_database != null) return _database;

    //inicializando o database
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
        //join para unir o path enome do banco
        join(await getDatabasesPath(), 'decor.db'),
        version: 1,
        onCreate: _onCreate);
  }

  _onCreate(db, version) async {
    //Vamos definir a creação das tables
    await db.execute(_profile);
    await db.execute(_products);
  }

  String get _profile => '''
    CREATE TABLE profile (
      id_profile INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT(20),
      cpf INTEGER,
      email VARCHAR(30),
      password VARCHAR(10),
      saldo_conta REAL
    )
  ''';

  String get _products => '''
    CREATE TABLE products (
      id_produto INT PRIMARY KEY AUTOINCREMENT,
      id_profile INT,
      name TEXT(50),
      description VARCHAR(100),
      price REAL
      FOREIGN KEY (id_perfil) REFERENCES profile(id_profile)
    )
  ''';
}
