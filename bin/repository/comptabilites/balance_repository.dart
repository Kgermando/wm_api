import 'package:postgres/postgres.dart';

import '../../models/comptabilites/balance_comptes_model.dart';

class BalanceRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BalanceRepository(this.executor, this.tableName);

  Future<List<BalanceModel>> getAllData() async {
    var data = <BalanceModel>{};
    var querySQL =
        "SELECT comptes FROM $tableName GROUP BY \"comptes\";";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BalanceModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(BalanceModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, comptes, debit, credit, solde, signature, created)"
        "VALUES (nextval('balances_id_seq'), @1, @2, @3, @4, @5, @6)",
        substitutionValues: {
          '1': data.comptes,
          '2': data.debit,
          '3': data.credit,
          '4': data.solde,
          '5': data.signature,
          '6': data.created 
        });
    });
  }

  Future<void> update(BalanceModel data) async {
    await executor.query("""UPDATE $tableName
        SET comptes = @1, debit = @2, credit = @3,
        solde = @4, signature = @5, created = @6 WHERE id = @7""", substitutionValues: {
      '1': data.comptes,
      '2': data.debit,
      '3': data.credit,
      '4': data.solde,
      '5': data.signature,
      '6': data.created,
      '7': data.id
    });
  }

  deleteData(int id) async {
    try {
      await executor.transaction((conn) async {
        // ignore: unused_local_variable
        var result = await conn.execute('DELETE FROM $tableName WHERE id=$id;');
      }
    );
    } catch (e) {
      'erreur $e';
    }
  }

  Future<BalanceModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM $tableName WHERE \"id\" = '$id'");
    return BalanceModel(
      id: data[0][0],
      comptes: data[0][1],
      debit: data[0][2],
      credit: data[0][3],
      solde: data[0][4],
      signature: data[0][5],
      created: data[0][6]
    );
  }
}
