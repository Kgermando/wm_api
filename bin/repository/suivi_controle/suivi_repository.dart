import 'package:postgres/postgres.dart';

import '../../models/suivi_controle/suivi_model.dart';

class SuiviRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  SuiviRepository(this.executor, this.tableName);

 
  Future<List<SuiviModel>> getAllData() async {
    var data = <SuiviModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(SuiviModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(SuiviModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, nom_social, travail_effectue,"
          "accusee_reception, signature, created, created_day, background, event_name)"
          "VALUES (nextval('suivis_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8)",
          substitutionValues: {
            '1': data.nomSocial,
            '2': data.travailEffectue,
            '3': data.accuseeReception,
            '4': data.signature,
            '5': data.created,
            '6': data.createdDay,
            '7': data.background,
            '8': data.eventName
          });
    });
  }

  Future<void> update(SuiviModel data) async {
   await executor.query("""UPDATE $tableName
    SET nom_social = @1, travail_effectue = @2, accusee_reception = @3,
    signature = @4, created = @5, created_day = @6, 
      background = @7, event_name = @8 WHERE id = @9""",
        substitutionValues: {
          '1': data.nomSocial,
          '2': data.travailEffectue,
          '3': data.accuseeReception,
          '4': data.signature,
          '5': data.created,
          '6': data.createdDay,
          '7': data.background,
          '8': data.eventName,
          '9': data.id
        });
  }

  deleteData(int id) async {
    try {
      await executor.transaction((conn) async {
        // ignore: unused_local_variable
        var result = await conn.execute('DELETE FROM $tableName WHERE id=$id;');
      });
    } catch (e) {
      'erreur $e';
    }
  }

  Future<SuiviModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return SuiviModel(
      id: data[0][0],
      nomSocial: data[0][1],
      travailEffectue: data[0][2],
      accuseeReception: data[0][3],
      signature: data[0][4],
      created: data[0][5],
      createdDay: data[0][6],
      background: data[0][7],
      eventName: data[0][8]
    );
  } 
}