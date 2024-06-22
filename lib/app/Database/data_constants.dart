// ignore: constant_identifier_names
const String kDATABASE_NAME = "";

const String kPRODUTOS_TABLE_NAME = "produtos";
const String kPRODUTOS_COLUMN_PRODUTOID = "produtoID";
const String kPRODUTOS_COLUMN_NOME = "nome";
const String kPRODUTOS_COLUMN_DESCRICAO = "descricao";
const String kPRODUTOS_COLUMN_VALOR = "valor";

//constante para criação da table

const String CREATE_PRODUTOS_TABLE_SRIPTO =
    '''CREATE TABLE $kPRODUTOS_TABLE_NAME (
    $kPRODUTOS_COLUMN_PRODUTOID INTEGER PRIMARY KEY,
    $kPRODUTOS_COLUMN_NOME TEXT,
    $kPRODUTOS_COLUMN_DESCRICAO TEXT,
    $kPRODUTOS_COLUMN_VALOR REAL)''';
