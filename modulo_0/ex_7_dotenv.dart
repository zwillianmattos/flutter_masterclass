import 'dart:io';

import 'package:mysql1/mysql1.dart';

void main() {
  DotEnv.getInstance().loadFile('.env');
  return MyApp().init();
}

class MyApp {
  init() async {
    MySqlConnection? conn = await _loadDb();
    Results results = await conn!.query('SELECT username, password FROM Account');
    for (var row in results) {
      print('name: ${row[0]}, password: ${row[1]}');
    }
  }
}

Future<MySqlConnection?> _loadDb() async {
  var settings = new ConnectionSettings(
      host: DotEnv.get('DB_HOST'),
      port: DotEnv.get('DB_PORT'),
      user: DotEnv.get('DB_USERNAME'),
      password: DotEnv.get('DB_PASSWORD'),
      db: DotEnv.get('DB_DATABASE'));

  MySqlConnection? conn = await MySqlConnection.connect(settings);

  return conn;
}

class DotEnv {
  static DotEnv? _instance;
  Map<String, dynamic> _variables = {};

  factory DotEnv.getInstance() {
    if (_instance == null) {
      _instance = DotEnv._();
    }
    return _instance!;
  }

  DotEnv._();

  void loadFile(envPath) {
    String env = File(envPath).readAsStringSync();

    List<String> lines = env.split('\n');
    for (String line in lines) {
      List<String> variableData = line.split('=');
      if (variableData.length == 2) {
        String variableName =
            variableData[0].trim().split('#').first.toUpperCase();
        String variableValue =
            variableData[1].trim().split('#').first.replaceAll('"', '');
        if (variableName != '' && variableValue != '') {
          _variables[variableName] = variableValue;
        }
      }
    }
  }

  static get(String p) => DotEnv.getInstance()._get(p);

  dynamic _get(String param) {
    final value = _variables[param.toUpperCase()];
    if (value is String) {
      if (value.toLowerCase() == 'true') {
        return true;
      } else if (value.toLowerCase() == 'false') {
        return false;
      } else if (value.toLowerCase() == 'null') {
        return null;
      } else {
        final parsedInt = int.tryParse(value);
        if (parsedInt != null) {
          return parsedInt;
        }
      }
    }
    return value;
  }
}
