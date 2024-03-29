import 'package:postgres/postgres.dart';

import '../../models/commercial/courbe_vente_gain_model.dart';
import '../../models/commercial/succursale_model.dart';
import '../../models/commercial/vente_chart_model.dart';

class SuccursaleRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  static const tableNameVente = 'ventes';
  static const tableNameGain = 'gains';

  SuccursaleRepository(this.executor, this.tableName);

  Future<List<SuccursaleModel>> getAllData() async {
    var data = <SuccursaleModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(SuccursaleModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<VenteChartModel>> getAllDataChart(String name) async {
    var data = <VenteChartModel>{};
    var querySQL =
      """SELECT "id_product_cart", COUNT(*) 
        FROM $tableNameVente WHERE "succursale"=$name 
        GROUP BY "id_product_cart" 
        ORDER BY COUNT DESC LIMIT 10;""";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(VenteChartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeVenteModel>> getVenteChartDay(String name) async {
    var data = <CourbeVenteModel>{};

    var querySQL =
      """SELECT EXTRACT(HOUR FROM "created" ::TIMESTAMP), 
      SUM("price_total_cart"::FLOAT) 
      FROM $tableNameVente WHERE "succursale"=$name AND 
      DATE("created") >= CURRENT_DATE AND 
      DATE("created") < CURRENT_DATE + INTERVAL '1 DAY'  
      GROUP BY EXTRACT(HOUR FROM "created" ::TIMESTAMP) 
      ORDER BY EXTRACT(HOUR FROM "created" ::TIMESTAMP) ASC;""";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeVenteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeVenteModel>> getVenteChartMounth(String name) async {
    var data = <CourbeVenteModel>{};
        // Filtre est egal à l'année et le mois actuel
    var querySQL = """SELECT EXTRACT(DAY FROM "created" ::TIMESTAMP), 
          SUM(price_total_cart::FLOAT) 
        FROM $tableNameVente WHERE "succursale"=$name AND 
        EXTRACT(MONTH FROM "created" ::TIMESTAMP) = EXTRACT(MONTH FROM CURRENT_DATE ::TIMESTAMP) AND
        EXTRACT(YEAR FROM "created" ::TIMESTAMP) = EXTRACT(YEAR FROM CURRENT_DATE ::TIMESTAMP)
        GROUP BY EXTRACT(DAY FROM "created" ::TIMESTAMP) 
        ORDER BY EXTRACT(DAY FROM "created" ::TIMESTAMP) ASC;
      """;
 
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeVenteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeVenteModel>> getVenteChartYear(String name) async {
    var data = <CourbeVenteModel>{};
   // Filtre est egal à l'année actuel
    var querySQL = """SELECT EXTRACT(MONTH FROM "created" ::TIMESTAMP), 
        SUM(price_total_cart::FLOAT) 
      FROM $tableNameVente WHERE "succursale"=$name AND
      EXTRACT(YEAR FROM "created" ::TIMESTAMP) = EXTRACT(YEAR FROM CURRENT_DATE ::TIMESTAMP)
      GROUP BY EXTRACT(MONTH FROM "created" ::TIMESTAMP) 
      ORDER BY EXTRACT(MONTH FROM "created" ::TIMESTAMP) ASC;
    """; 
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeVenteModel.fromSQL(row));
    }
    return data.toList();
  }


  Future<List<CourbeGainModel>> getGainChartDay(String name) async {
    var data = <CourbeGainModel>{};

    var querySQL =
        """SELECT EXTRACT(HOUR FROM "created" ::TIMESTAMP), 
        SUM("sum"::FLOAT) FROM $tableNameGain 
        WHERE "succursale"=$name AND 
        DATE("created") >= CURRENT_DATE AND 
        DATE("created") < CURRENT_DATE + INTERVAL '1 DAY'  
        GROUP BY EXTRACT(HOUR FROM "created" ::TIMESTAMP) 
        ORDER BY EXTRACT(HOUR FROM "created" ::TIMESTAMP) ASC ;""";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeGainModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeGainModel>> getGainChartMounth(String name) async {
    var data = <CourbeGainModel>{};
    var querySQL =
    """SELECT EXTRACT(DAY FROM "created" ::TIMESTAMP), 
          SUM(sum::FLOAT) 
        FROM $tableNameGain WHERE "succursale"=$name AND
        EXTRACT(MONTH FROM "created" ::TIMESTAMP) = EXTRACT(MONTH FROM CURRENT_DATE ::TIMESTAMP) AND
        EXTRACT(YEAR FROM "created" ::TIMESTAMP) = EXTRACT(YEAR FROM CURRENT_DATE ::TIMESTAMP)
        GROUP BY EXTRACT(DAY FROM "created" ::TIMESTAMP) 
        ORDER BY EXTRACT(DAY FROM "created" ::TIMESTAMP) ASC;
      """;  
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeGainModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeGainModel>> getGainChartYear(String name) async {
    var data = <CourbeGainModel>{};
    var querySQL = """SELECT EXTRACT(MONTH FROM "created" ::TIMESTAMP), 
        SUM(sum::FLOAT)
      FROM $tableNameGain WHERE "succursale"=$name AND
      EXTRACT(YEAR FROM "created" ::TIMESTAMP) = EXTRACT(YEAR FROM CURRENT_DATE ::TIMESTAMP)
      GROUP BY EXTRACT(MONTH FROM "created" ::TIMESTAMP) 
      ORDER BY EXTRACT(MONTH FROM "created" ::TIMESTAMP) ASC;
    """; 
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeGainModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(SuccursaleModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, name, adresse,"
          "province, signature, created,"
          "approbation_dg, motif_dg, signature_dg, approbation_dd, motif_dd, signature_dd)"
          "VALUES (nextval('succursales_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11)",
          substitutionValues: {
            '1': data.name,
            '2': data.adresse,
            '3': data.province,
            '4': data.signature,
            '5': data.created,
            '6': data.approbationDG,
            '7': data.motifDG,
            '8': data.signatureDG,
            '9': data.approbationDD,
            '10': data.motifDD,
            '11': data.signatureDD
          });
    });
  }

  Future<void> update(SuccursaleModel data) async {
    await executor.query("""UPDATE $tableName
          SET name = @1, adresse = @2, province = @3,
          signature = @4, created = @5, approbation_dg = @6, motif_dg = @7,
        signature_dg = @8, approbation_dd = @9,
        motif_dd = @10, signature_dd = @11 WHERE id = @12""",
        substitutionValues: {
          '1': data.name,
          '2': data.adresse,
          '3': data.province,
          '4': data.signature,
          '5': data.created,
          '6': data.approbationDG,
          '7': data.motifDG,
          '8': data.signatureDG,
          '9': data.approbationDD,
          '10': data.motifDD,
          '11': data.signatureDD,
          '12': data.id
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

  Future<SuccursaleModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return SuccursaleModel(
        id: data[0][0],
        name: data[0][1],
        adresse: data[0][2],
        province: data[0][3],
        signature: data[0][4],
        created: data[0][5],
        approbationDG: data[0][6],
        motifDG: data[0][7],
        signatureDG: data[0][8],
        approbationDD: data[0][9],
        motifDD: data[0][10],
        signatureDD: data[0][11]);
  }
}
