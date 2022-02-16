import 'package:flutter/material.dart';
import 'package:product_card_challenge/theme/colors.dart';

class ProductNotifier extends ChangeNotifier {
  ProductNotifier({ShoesColor? color, int? size}) {
    _color = color ?? ShoesColor.blue;
    _oldColor = _color;
    _size = size ?? 7;
  }

  late ShoesColor _color;
  late ShoesColor _oldColor;
  late int _size;

  ShoesColor get color => _color;
  ShoesColor get oldColor => _oldColor;
  int get size => _size;

  void setColor(ShoesColor value) {
    _oldColor = color;
    _color = value;
    notifyListeners();
  }

  void setSize(int value) {
    _oldColor = _color;
    _size = value;
    notifyListeners();
  }
}

enum ShoesColor { blue, red, green, orange, black }

extension ShoesColorX on ShoesColor {
  List<Color> get gradientColors {
    switch (this) {
      case ShoesColor.blue:
        return [AppColors.blue, AppColors.lightBlue];

      case ShoesColor.red:
        return [AppColors.red, AppColors.lightRed];

      case ShoesColor.green:
        return [AppColors.green, AppColors.lightGreen];

      case ShoesColor.orange:
        return [AppColors.orange, AppColors.lightOrange];

      case ShoesColor.black:
        return [AppColors.black, AppColors.lightBlack!];
    }
  }

  Color get value => gradientColors.last;

  String get assetImage => 'assets/images/$name.png';
}
