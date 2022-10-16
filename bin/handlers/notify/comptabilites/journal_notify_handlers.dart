import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/notify/notify_model.dart';
import '../../../repository/repository.dart';

class JournalNotifyHandlers {
  final Repository repos;

  JournalNotifyHandlers(this.repos);

  Router get router {
    final router = Router();
 
    router.get('/get-count-dd/', (Request request) async {
      NotifyModel data = await repos.journalNotifyCount.getCountDD();
      return Response.ok(jsonEncode(data));
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Journal count n\'est pas trouvé'),
    );
    return router;
  }
}
