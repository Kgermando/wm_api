import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:shelf/shelf.dart';

class UploadFile {
  uploadImage(Uint8List imageData, String fileName) async {
    try {
      final uploadDirectory = Directory('storage');
      if (await uploadDirectory.exists() == false) {
        await uploadDirectory.create();
      }
      File file = await File('${uploadDirectory.path}/$fileName').create();
      print(await file.exists());
      var res = await file.writeAsBytes(imageData);
      return res.path;
    } catch (e) {
      return {"message": "$e"};
    }
  }
}