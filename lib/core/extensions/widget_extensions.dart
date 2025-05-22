import 'package:flutter/material.dart';

extension ColumnExtension on Column {
  Widget addSpacing(double? spacing) {
    return children.fold(
      const SizedBox.shrink(),
      (previousValue, element) => Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        textDirection: textDirection,
        key: key,
        children: [
          previousValue,
          element,
          SizedBox(height: spacing ?? 16),
        ],
      ),
    );
  }
}
