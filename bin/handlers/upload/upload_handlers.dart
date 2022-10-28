import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UploadHandlers {
  
  Router get router {
    final router = Router();

    router.post('/', (Request request, String fileName) async {
      try { 
        var input = jsonDecode(await request.readAsString());
        final uploadDirectory = Directory('storage');
        if (await uploadDirectory.exists() == false) {
          await uploadDirectory.create();
        }
        File file = await File('${uploadDirectory.path}/$fileName').create();
        print(await file.exists());
        var res = await file.writeAsBytes(input as Uint8List);
        return res.path;
      } catch (e) {
        return {"message": "$e"};
      }
    });

    // router.get('/<imageId>', (Request request, String imageId) async {
    //     try {
    //       File file = File('storage/$imageId');
    //       return Response.ok(file.readAsBytesSync(),
    //           headers: {'Content-type': 'application/octet-stream'});
    //     } catch (e) {
    //       print(e);
    //       return Response.internalServerError(
    //           body: jsonEncode({'message': "$e"}));
    //     }
    //   }
    // );
 


    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Upload file page n\'est pas trouvé'),
    );

    return router;
   }
}