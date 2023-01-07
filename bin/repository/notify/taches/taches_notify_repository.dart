import 'package:postgres/postgres.dart';

import '../../../models/notify/notify_model.dart';

class TacheNotifyRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  TacheNotifyRepository(this.executor, this.tableName);

  static const tableNameRapport = 'rapports';

  // Notife l'agent d'une nouvelle tache
  Future<NotifyModel> getCountTache(String matricule) async {
    try {
      var data = <NotifyModel>{};
      var querySQL = """SELECT COUNT(*) FROM $tableName where  
        "agent"='$matricule' AND "read_agent" = 'Non Lu';""";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(NotifyModel.fromSQL(row));
      }
      return data.single;
    } catch (e) {
      throw NotifyModel;
    }
  }

  // Notife le boss d'un nouveau rapport
  Future<NotifyModel> getCountRapport(String matricule) async {
    try {
      var data = <NotifyModel>{};
      var querySQL = """SELECT COUNT(*) FROM $tableNameRapport where  
        "agent"='$matricule' AND "read_rapport" = 'Non Lu';""";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(NotifyModel.fromSQL(row));
      }
      return data.single;
    } catch (e) {
      throw NotifyModel;
    }
  }
}
