// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:fl_lib/fl_lib.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

const _level2Color = {
  'INFO': Color(0xffbb2d6f),
  'WARNING': Colors.yellow,
  'ERROR': Colors.red,
};

final class DebugProvider {
  static const int maxLines = 100;
  static final widgets = <Widget>[].vn;
  static final lines = <String>[];

  DebugProvider._();

  static final instance = DebugProvider._();

  void addLog(LogRecord record) {
    final color = _level2Color[record.level.name] ?? Colors.blue;
    final title = '[${DateTime.now().hourMinute}][${record.loggerName}]';
    final level = '[${record.level}]';
    final message = record.error == null
        ? '\n${record.message}'
        : '\n${record.message}: ${record.error}';
    lines.add('$title$level$message');
    widgets.value.add(Text.rich(TextSpan(
      children: [
        TextSpan(text: title, style: TextStyle(color: color)),
        TextSpan(text: level, style: TextStyle(color: color)),
        TextSpan(
          text: message,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    )));
    if (record.stackTrace != null) {
      widgets.value.add(SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          '${record.stackTrace}',
          style: const TextStyle(color: Colors.white),
        ),
      ));
    }
    widgets.value.add(UIs.height13);
    if (widgets.value.length > maxLines) {
      widgets.value.removeRange(0, widgets.value.length - maxLines);
    }
    widgets.notify();

    if (lines.length > maxLines) {
      lines.removeRange(0, lines.length - maxLines);
    }
  }

  void clear() {
    widgets.value.clear();
    lines.clear();
    widgets.notify();
  }

  void copy() => Pfs.copy(lines.join('\n'));
}
