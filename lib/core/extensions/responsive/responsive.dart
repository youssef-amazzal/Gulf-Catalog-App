import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= BreakPoints.xl
        ? (xl ?? lg ?? md ?? sm ?? defaultVal)
        : wd >= BreakPoints.lg
            ? (lg ?? md ?? sm ?? defaultVal)
            : wd >= BreakPoints.md
                ? (md ?? sm ?? defaultVal)
                : wd >= BreakPoints.sm
                    ? (sm ?? defaultVal)
                    : defaultVal;
  }

  T dynamicResponsive<T>(
    T defaultVal, {
    List<BreakPointOption<T>>? options,
  }) {
    final wd = MediaQuery.of(this).size.width;
    if (options == null) return defaultVal;
    options.sort((a, b) => b.width.compareTo(a.width));
    for (final bp in options) {
      if (wd >= bp.width) return bp.item;
    }
    return defaultVal;
  }
}

typedef BreakPointOption<T> = ({int width, T item});

class BreakPoints {
  static const sm = 640;
  static const md = 768;
  static const lg = 900;
  static const xl = 1280;
}
