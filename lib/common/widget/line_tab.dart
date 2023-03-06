import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineTabIndicator extends Decoration {
  final double strokeWidth;
  final double lineHeight;
  final Color color;

  const LineTabIndicator({
    required this.strokeWidth,
    required this.lineHeight,
    required this.color,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _LinePainter(
      strokeWidth: strokeWidth,
      lineHeight: lineHeight,
      color: color,
    );
  }
}

class _LinePainter extends BoxPainter {
  final double strokeWidth;
  final double lineHeight;
  final Paint _paint;

  _LinePainter({
    required this.strokeWidth,
    required this.lineHeight,
    required Color color,
  }) : _paint = Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final left = offset.dx + 40.h;
    final top = offset.dy + cfg.size!.height - lineHeight;
    final right = offset.dx + cfg.size!.width - 40.h;
    final bottom = offset.dy + cfg.size!.height;
    final line = Rect.fromLTRB(left, top, right, bottom);
    canvas.drawRect(line, _paint);
  }
}
