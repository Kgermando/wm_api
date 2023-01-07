import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/notify/notify_model.dart';
import '../../../repository/repository.dart';

class TacheNotifyHandlers {
  final Repository repos;

  TacheNotifyHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/get-count/<matricule>', (Request request, String matricule) async {
      NotifyModel data = await repos.tacheNotifyCount.getCountTache(matricule);
      return Response.ok(jsonEncode(data));
    });


    router.get('/get-count-rapport/<matricule>',
        (Request request, String matricule) async {
      NotifyModel data = await repos.tacheNotifyCount.getCountRapport(matricule);
      return Response.ok(jsonEncode(data));
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Tache-rapport count n\'est pas trouvé'),
    );
    return router;
  }
}
