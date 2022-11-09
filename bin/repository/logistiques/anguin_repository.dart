import 'package:postgres/postgres.dart';

import '../../models/charts/pie_chart_model.dart';
import '../../models/logistiques/anguin_model.dart';

class AnguinRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AnguinRepository(this.executor, this.tableName);

  Future<List<AnguinModel>> getAllData() async {
    var data = <AnguinModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AnguinModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<PieChartEnguinModel>> getChartPie() async {
    try {
      var data = <PieChartEnguinModel>{};

      var querySQL =
          "SELECT genre, COUNT(genre) FROM $tableName GROUP BY \"genre\";";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(PieChartEnguinModel.fromSQL(row));
      }
      return data.toList();
    } catch (e) {
      throw PieChartEnguinModel;
    }
  }

  Future<void> insertData(AnguinModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, modele, marque, numero_chassie,"
        "couleur, genre, qty_max_reservoir, date_fabrication, nomero_plaque,"
        "nomero_entreprise, kilometrage_initiale, provenance, type_caburant,"
        "type_moteur, signature, created,"
        "approbation_dg, motif_dg, signature_dg, approbation_dd, motif_dd, signature_dd)"
        "VALUES (nextval('anguins_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10, @11, @12, @13, @14, @15, @16, @17, @18, @19, @20, @21)",
        substitutionValues: {
          '1': data.modele,
          '2': data.marque,
          '3': data.numeroChassie,
          '4': data.couleur,
          '5': data.genre,
          '6': data.qtyMaxReservoir,
          '7': data.dateFabrication,
          '8': data.nomeroPLaque,
          '9': data.nomeroEntreprise,
          '10': data.kilometrageInitiale,
          '11': data.provenance,
          '12': data.typeCaburant,
          '13': data.typeMoteur,
          '14': data.signature,
          '15': data.created,
          '16': data.approbationDG,
          '17': data.motifDG,
          '18': data.signatureDG,
          '19': data.approbationDD,
          '20': data.motifDD,
          '21': data.signatureDD 
        });
    });
  }


  
  Future<void> update(AnguinModel data) async {
    await executor.execute("""UPDATE $tableName
      SET modele = @1, marque = @2, numero_chassie = @3, couleur = @4,
      genre = @5, qty_max_reservoir = @6, date_fabrication = @7, nomero_plaque = @8,
      nomero_entreprise = @9, kilometrage_initiale = @10, provenance = @11,
      type_caburant = @12, type_moteur = @13, signature = @14,
      created = @15, approbation_dg = @16, motif_dg = @17, motif_dd = @18,
      signature_dg = @19, approbation_dd = @20,
      signature_dd = @21 WHERE id = @22""",
      substitutionValues: {
        '1': data.modele,
      '2': data.marque,
      '3': data.numeroChassie,
      '4': data.couleur,
      '5': data.genre,
      '6': data.qtyMaxReservoir,
      '7': data.dateFabrication,
      '8': data.nomeroPLaque,
      '9': data.nomeroEntreprise,
      '10': data.kilometrageInitiale,
      '11': data.provenance,
      '12': data.typeCaburant,
      '13': data.typeMoteur,
      '14': data.signature,
      '15': data.created,
      '16': data.approbationDG,
      '17': data.motifDG,
      '18': data.signatureDG,
      '19': data.approbationDD,
      '20': data.motifDD,
      '21': data.signatureDD,
        '22': data.id
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

  Future<AnguinModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return AnguinModel(
      id: data[0][0],
      modele: data[0][1],
      marque: data[0][2],
      numeroChassie: data[0][3],
      couleur: data[0][4],
      genre: data[0][5],
      qtyMaxReservoir: data[0][6],
      dateFabrication: data[0][7],
      nomeroPLaque: data[0][8],
      nomeroEntreprise: data[0][9],
      kilometrageInitiale: data[0][10],
      provenance: data[0][11],
      typeCaburant: data[0][12],
      typeMoteur: data[0][13],
      signature: data[0][14],
      created: data[0][15],
      approbationDG: data[0][16],
      motifDG: data[0][17],
      signatureDG: data[0][18],
      approbationDD: data[0][19],
      motifDD: data[0][20],
      signatureDD: data[0][21] 
    );
  }
}