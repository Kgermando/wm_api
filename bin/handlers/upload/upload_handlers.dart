import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:shelf/shelf.dart';

import 'package:shelf_multipart/form_data.dart';
import 'package:shelf_multipart/multipart.dart';
 
import 'package:shelf_router/shelf_router.dart';

class UploadHandlers {
  
  Router get router {
    final router = Router(); 

    router.get('/<imageId>', (Request request, String imageId) async {
        try {
          File file = File('storage/$imageId');
          return Response.ok(file.readAsBytesSync(),
              headers: {'Content-type': 'application/octet-stream'});
        } catch (e) {
          print(e);
          return Response.internalServerError(
              body: jsonEncode({'message': "$e"}));
        }
      }
    );

    router.post('/file', (Request request) async {
      if (!request.isMultipart) {
        return Response.ok('Not a multipart request');
      } else if (request.isMultipartForm) {
        final description = StringBuffer('Parsed form multipart request\n');

        await for (final formData in request.multipartFormData) {
          description
              .writeln('${formData.name}: ${await formData.part.readString()}');
        }

        return Response.ok(description.toString());
      } else {
        final description = StringBuffer('Regular multipart request\n');

        await for (final part in request.parts) {
          description.writeln('new part');

          part.headers.forEach(
              (key, value) => description.writeln('Header $key=$value'));
          final content = await part.readString();
          description.writeln('content: $content');

          description.writeln('end of part');
        }

        return Response.ok(description.toString());
      }
    });


    // Future<Response> _handler(Request request) async {
    //   if (!request.isMultipart) {
    //     return Response.ok('Not a multipart request');
    //   } else if (request.isMultipartForm) {
    //     final description = StringBuffer('Parsed form multipart request\n');

    //     await for (final formData in request.multipartFormData) {
    //       description
    //           .writeln('${formData.name}: ${await formData.part.readString()}');
    //     }

    //     return Response.ok(description.toString());
    //   } else {
    //     final description = StringBuffer('Regular multipart request\n');

    //     await for (final part in request.parts) {
    //       description.writeln('new part');

    //       part.headers.forEach(
    //           (key, value) => description.writeln('Header $key=$value'));
    //       final content = await part.readString();
    //       description.writeln('content: $content');

    //       description.writeln('end of part');
    //     }

    //     return Response.ok(description.toString());
    //   }
    // }
 


    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Upload file page n\'est pas trouvé'),
    );

    return router;
   }
}