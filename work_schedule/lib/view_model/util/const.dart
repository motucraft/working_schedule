import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kPrimaryColor = Color(0xFFFF7043);
const kPrimaryLightColor = Color(0xFFFBE9E7);

class Const {
  /// エポック
  static final epochTime = DateTime(1970);

  /// 日付フォーマット
  static final dateFormat = DateFormat('yyyy年 M月 d日', 'ja');

  /// 日付フォーマット(曜日付き)
  static final dateFormatOfTheWeek = DateFormat('yyyy年 M月 d日 (E)', 'ja');

  /// 時刻フォーマット
  static final timeFormat = DateFormat('H時 mm分', 'ja');

  /// 年月フォーマット
  static final yearAndMonth = DateFormat('yyyy年 M月', 'ja');
}
