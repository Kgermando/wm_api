import 'package:postgres/postgres.dart';

import '../../../models/notify/notify_model.dart';

class BalanceNotifyRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BalanceNotifyRepository(this.executor, this.tableName);
 

  Future<NotifyModel> getCountDD() async {
    try {
      var data = <NotifyModel>{};
      var querySQL = """SELECT COUNT(*) FROM $tableName where
           "approbation_dd" = '-' AND
           "is_submit" = 'true';""";
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
 