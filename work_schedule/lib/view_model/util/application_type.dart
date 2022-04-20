/// 申請区分
enum ApplicationType {
  Work,
  Leave,
}

extension ApplicationTypeExtension on ApplicationType {
  static ApplicationType fromString(String text) {
    switch (text.toLowerCase()) {
      case '0':
        return ApplicationType.Work;
      case '1':
        return ApplicationType.Leave;
      default:
        throw Exception('Internal Error.');
    }
  }

  String get name {
    switch (this) {
      case ApplicationType.Work:
        return 'work';
      case ApplicationType.Leave:
        return 'leave';
      default:
        throw Exception('Internal Error.');
    }
  }

  /// 申請区分のコード値を返却します。
  String get code {
    switch (this) {
      case ApplicationType.Work:
        return '0';
      case ApplicationType.Leave:
        return '1';
      default:
        throw Exception('Internal Error.');
    }
  }
}
