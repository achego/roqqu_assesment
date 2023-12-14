import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox spaceh(num height) {
  return SizedBox(height: height.h);
}

SliverToBoxAdapter sspaceh(num height) {
  return SliverToBoxAdapter(child: SizedBox(height: height.h));
}

SizedBox spacew(num width) {
  return SizedBox(width: width.h);
}

SizedBox spacehw(num height, num width) {
  return SizedBox(height: height.h, width: width.w);
}

SizedBox square(num size, {Widget? child}) {
  return SizedBox(height: size.h, width: size.w, child: child);
}

SizedBox fittedSize(num height, num width, {Widget? child}) {
  return SizedBox(
      height: height.h, width: width.w, child: FittedBox(child: child));
}
