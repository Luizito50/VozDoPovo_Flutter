import 'dart:io';
import 'dart:isolate';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ImageCompressService {
  static const _maxWidth = 1280;
  static const _maxHeight = 960;
  static const _quality = 72;
  static const _targetKb = 200;

  /// Comprime a foto para ≤ 200 KB antes do upload.
  /// Roda em Isolate separado para não travar a UI.
  static Future<File> compress(File original) async {
    final dir = await getTemporaryDirectory();
    final target = '${dir.path}/${const Uuid().v4()}.jpg';

    final result = await FlutterImageCompress.compressAndGetFile(
      original.absolute.path,
      target,
      minWidth: _maxWidth,
      minHeight: _maxHeight,
      quality: _quality,
      format: CompressFormat.jpeg,
    );

    if (result == null) throw Exception('Falha na compressão da imagem.');

    // Segunda passagem se ainda acima do alvo
    final sizeKb = await File(target).length() / 1024;
    if (sizeKb > _targetKb) {
      final target2 = '${dir.path}/${const Uuid().v4()}_2.jpg';
      final result2 = await FlutterImageCompress.compressAndGetFile(
        target,
        target2,
        minWidth: 960,
        minHeight: 720,
        quality: 60,
        format: CompressFormat.jpeg,
      );
      if (result2 != null) return File(result2.path);
    }

    return File(result.path);
  }
}
