import 'package:flutter/material.dart';

class AppConstants {
  final BuildContext context;
  AppConstants(this.context);

  // 1. الأساسيات (Screen Dimensions)
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  // 2. مسافات موحدة (Spacing System)
  // بدل ما تكتب 16 في كل مكان، بتستخدم دول عشان لو حبيت تغير المسافات في الأبلكيشن كله من مكان واحد
  static const double spaceExtraSmall = 4.0;
  static const double spaceSmall = 8.0;
  static const double spaceMedium = 16.0;
  static const double spaceLarge = 24.0;
  static const double spaceExtraLarge = 32.0;
  static const double spaceHuge = 40.0;

  // 3. أحجام الصور (Image Ratios & Heights)
  // هنا بنحط أرقام ثابتة للأجزاء اللي محتاجة استقرار
  double get movieCardHeight => 280.0; // ثابت عشان الـ Horizontal Scroll
  double get movieCardWidth => 300.0; // ثابت عشان الـ Horizontal Scroll
  double get posterAspectRatio => 2 / 3; // نسبة البوستر الطولي
  double get backdropAspectRatio => 16 / 9; // نسبة الخلفية العرضية
  double get posterHeight => 200; // ارتفاع البوستر بيكون 40% من عرض الشاشة
  double get tabHeight => 400.0; // ارتفاع التاب الثابت
  // 4. أحجام الأيقونات (Icon Sizes)
  static const double iconSmall = 18.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;

  // 5. الحواف (Border Radius)
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 15.0;
}
