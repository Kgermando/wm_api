import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UploadHandlers {
  
  Router get router {
    final router = Router();

    router.get('/', (Request request, String imageId) async {
        try {
          File file = File('storage/$imageId');
          return Response.ok(file.readAsBytesSync(),
              headers: {'Content-type': 'application/octet-stream'});
        } catch (e) {
          return Response.internalServerError(
              body: jsonEncode({'message': "$e"}));
        }
      }
    );



    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Upload file page n\'est pas trouvé'),
    );

    return router;
   }
}