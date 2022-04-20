import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/provider.dart';

class UnapprovedView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authenticationController =
        useProvider(authenticationProvider.notifier);
    return Container();
  }
}
