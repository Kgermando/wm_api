import 'package:postgres/postgres.dart';

import '../../models/suivi_controle/abonnement_client_model.dart';

class AbonnementRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AbonnementRepository(this.executor, this.tableName, {sommeContrat});

  Future<List<AbonnementClientModel>> getAllData() async {
    var data = <AbonnementClientModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AbonnementClientModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(AbonnementClientModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, reference, date_fin_contrat, type_contrat,"
          "montant, date_debut_et_fin_contrat,"
          "signataire_contrat, signature, created)"
          "VALUES (nextval('abonnement_clients_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8)",
          substitutionValues: {
            '1': data.reference,
            '2': data.dateFinContrat,
            '3': data.typeContrat,
            '4': data.montant,
            '5': data.dateDebutEtFinContrat,
            '6': data.signataireContrat,
            '7': data.signature,
            '8': data.created 
          });
    });
  }

  Future<void> update(AbonnementClientModel data) async {
    await executor.query("""UPDATE $tableName
          SET reference = @1, date_fin_contrat = @2, type_contrat = @3,
          montant = @4, date_debut_et_fin_contrat = @5, 
          signataire_contrat = @6, signature = @7,
          created = @8 WHERE id = @9""",
        substitutionValues: {
          '1': data.reference,
          '2': data.dateFinContrat,
          '3': data.typeContrat,
          '4': data.montant,
          '5': data.dateDebutEtFinContrat,
          '6': data.signataireContrat,
          '7': data.signature,
          '8': data.created,
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

  Future<AbonnementClientModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return AbonnementClientModel(
      id: data[0][0],
      reference: data[0][1],
      dateFinContrat: data[0][2],
      typeContrat: data[0][3],
      montant: data[0][4],
      dateDebutEtFinContrat: data[0][5],
      signataireContrat: data[0][6],
      signature: data[0][7],
      created: data[0][8] 
    );
  }
}
