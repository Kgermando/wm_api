import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/commercial/courbe_vente_gain_model.dart';
import '../../models/commercial/succursale_model.dart';
import '../../models/commercial/vente_chart_model.dart';
import '../../repository/repository.dart';

class SuccursaleHandlers {
  final Repository repos;

  SuccursaleHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<SuccursaleModel> data = await repos.succursales.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/vente-chart/', (Request request, String name) async {
      List<VenteChartModel> data = await repos.succursales.getAllDataChart(name);
      return Response.ok(jsonEncode(data));
    });

    router.get('/vente-chart-day/', (Request request, String name) async {
      List<CourbeVenteModel> data = await repos.succursales.getVenteChartDay(name);
      return Response.ok(jsonEncode(data));
    });

    router.get('/vente-chart-month/', (Request request, String name) async {
      List<CourbeVenteModel> data = await repos.succursales.getVenteChartMounth(name);
      return Response.ok(jsonEncode(data));
    });

    router.get('/vente-chart-year/', (Request request, String name) async {
      List<CourbeVenteModel> data = await repos.succursales.getVenteChartYear(name);
      return Response.ok(jsonEncode(data));
    });

    router.get('/gain-chart-day/', (Request request, String name) async {
      List<CourbeGainModel> data = await repos.succursales.getGainChartDay(name);
      return Response.ok(jsonEncode(data));
    });

    router.get('/gain-chart-month/', (Request request, String name) async {
      List<CourbeGainModel> data = await repos.succursales.getGainChartMounth(name);
      return Response.ok(jsonEncode(data));
    });

    router.get('/gain-chart-year/', (Request request, String name) async {
      List<CourbeGainModel> data = await repos.succursales.getGainChartYear(name);
      return Response.ok(jsonEncode(data));
    });


    router.get('/<id>', (Request request, String id) async {
      late SuccursaleModel data;
      try {
        data = await repos.succursales.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-succursale', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      SuccursaleModel data = SuccursaleModel(
          name: input['name'],
          adresse: input['adresse'],
          province: input['province'],
          signature: input['signature'],
          created: DateTime.parse(input['created']),
          approbationDG: input['approbationDG'],
          motifDG: input['motifDG'],
          signatureDG: input['signatureDG'],
          approbationDD: input['approbationDD'],
          motifDD: input['motifDD'],
          signatureDD: input['signatureDD']);
      try {
        await repos.succursales.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-succursale/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = SuccursaleModel.fromJson(input);
      SuccursaleModel? data =
          await repos.succursales.getFromId(editH.id!); 

      if (input['name'] != null) {
        data.name = input['name'];
      }
      if (input['adresse'] != null) {
        data.adresse = input['adresse'];
      }
      if (input['province'] != null) {
        data.province = input['province'];
      }

      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['approbationDG'] != null) {
        data.approbationDG = input['approbationDG'];
      }
      if (input['motifDG'] != null) {
        data.motifDG = input['motifDG'];
      }
      if (input['signatureDG'] != null) {
        data.signatureDG = input['signatureDG'];
      }
      if (input['approbationDD'] != null) {
        data.approbationDD = input['approbationDD'];
      }
      if (input['motifDD'] != null) {
        data.motifDD = input['motifDD'];
      }
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
      }
      repos.succursales.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-succursale/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.succursales.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page succursale n\'est pas trouvé'),
    );

    return router;
  }
}
