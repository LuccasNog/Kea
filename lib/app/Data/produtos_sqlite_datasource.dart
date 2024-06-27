import 'package:decor/app/Core/data/data_general_constants.dart';
import 'package:decor/app/Data/data_constants.dart';
import 'package:path/path.dart'; // Para lidar com caminhos de arquivo
import 'package:sqflite/sqflite.dart';

class ProdutosSQLiteDatasource {
  Future<Database> _getDatabase() async {
    /*
    await deleteDatabase(
      join(await getDatabasesPath(),
     kDATABASE_NAME));
    */

    // Abre/cria o banco de dados no caminho especificado
    return openDatabase(
      join(await getDatabasesPath(), kDATABASE_NAME),
      onCreate: (db, version) async {
        // Cria as tabelas necessárias
        await db.execute(kCREATE_PRODUTOS_TABLE_SCRIPT);

        // aqui vamos colocar os dados falsos por enquanto
        await db.rawInsert(
            '''insert into $kPRODUTOS_TABLE_NAME($kPRODUTOS_COLUMN_NOME, $kPRODUTOS_COLUMN_DESCRICAO, $kPRODUTOS_COLUMN_VALOR)
        VALUES ('Mesa de Jantar', '1 Metro', 5 ''');
      },
      version: kDATABASEVERSION,
    );
  }
}

//https://www.youtube.com/watch?v=Y-ZscK4r94U&list=PLBoF7z0kJIejDKlx1KxoPP2qsGHr6TaSe&index=3