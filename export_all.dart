#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

void main() async {
  final exportAll = StringBuffer();
  exportAll.writeln('library fl_lib;\n');

  await for (final entity in Directory('lib/src').list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      // Skip the l10n directory and l10n.dart file.
      if (entity.path.startsWith('l10n')) continue;
      if (entity.path == 'lib/src/res/l10n.dart') continue;

      // If first line starts with `part of`, skip it.
      final firstLine = await entity
          .openRead()
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .first;
      if (firstLine.startsWith('part of')) continue;

      exportAll.writeln("export '${entity.path.replaceFirst('lib/', '')}';");
    }
  }

  await File('lib/fl_lib.dart').writeAsString(exportAll.toString());
}
