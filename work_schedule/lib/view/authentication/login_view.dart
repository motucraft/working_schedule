import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/controller/authentication_controller.dart';
import '../../view_model/provider.dart';
import '../component/rounded_button.dart';
import '../component/rounded_input_field.dart';
import '../component/rounded_password_field.dart';
import '../work_schedule_home_view.dart';

class LoginView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final userController = useProvider(userProvider.notifier);
    final authenticationController =
        useProvider(authenticationProvider.notifier);

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      // 画面タップでフォーカスを外す(キーボードを閉じる)
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          height: size.height,
          width: double.infinity,
          color: Colors.deepOrangeAccent[50],
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.2),
                Text(
                  '勤務予定管理',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  hintText: '従業員コード',
                  onChanged: (value) {
                    userController.setUserId(value);
                  },
                ),
                RoundedPasswordField(
                  onChanged: (value) {
                    userController.setPassword(value);
                  },
                ),
                RoundedButton(
                  text: 'LOGIN',
                  onPressed: () => _login(context, authenticationController),
                ),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ログイン
  _login(BuildContext context,
      AuthenticationController authenticationController) async {
    // ログイン処理
    authenticationController.login();

    // ログイン後の画面遷移
    // ログイン処理の完了を待たずに画面遷移させる
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkScheduleHomeView(),
      ),
    );
  }
}
