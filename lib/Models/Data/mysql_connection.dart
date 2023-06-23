import 'package:mysql_utils/mysql_utils.dart';

class MySQLConnection {
  static const String _severName = "192.168.43.183";  // IP da onde o MySQL Workbench está
  static const int _port = 3306;  // Porta pra conversar com o servidor do MySQL
  static const String _username = "Project POO";
  static const String _password = "Pedro257!";
  static const String _databaseUsed = "ExpansiveManager"; // Opcional pois posso trabalhar com uma ou mais esquemáticos

  static final Map<String, Object> _settings = {
    'host': _severName,
    'port': _port,
    'user': _username,
    'password': _password,
    'db': _databaseUsed,
    // Esses 3 tem que por mesmo, n funciona sem
    'secure': true,
    'prefix': '',
    'pool': false,
  };

  static final MysqlUtils connection = MysqlUtils(
    settings: _settings,
    errorLog: (error) {
      print(error);
    },
    sqlLog: (sql) {
      print(sql);
    },
    connectInit: (db1) async {
      print(db1);
      print('When Complete');
    },
  ); // Conexão com o BD

  static Future<void> closeConnection() async {
    bool isAlive = await connection.isConnectionAlive();
    if(isAlive) {
      await connection.close();
      return;
    }
    print("You aren't connected to db");
  }
}
