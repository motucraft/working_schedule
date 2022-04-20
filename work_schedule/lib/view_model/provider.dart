import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_platform/universal_platform.dart';

import '../model/model/application_model.dart';
import '../model/model/user_model.dart';
import '../model/repository/application/application_repository_native_impl.dart';
import '../model/repository/application/application_repository_web_impl.dart';
import '../model/repository/authentication/authentication_repository_native_impl.dart';
import '../model/repository/authentication/authentication_repository_web_impl.dart';
import '../model/repository/master/master_repository_native_impl.dart';
import '../model/repository/master/master_repository_web_impl.dart';
import '../view_model/controller/application_history_controller.dart';
import '../view_model/state/application_history/application_history_state.dart';
import '../view_model/state/authentication/user_state.dart';
import '../view_model/state/calendar/application_state.dart';
import '../view_model/state/calendar/calendar_state.dart';
import '../view_model/state/master/master_state.dart';
import '../view_model/state/setting/setting_state.dart';
import 'controller/application_async_value_controller.dart';
import 'controller/application_controller.dart';
import 'controller/application_history_async_value_controller.dart';
import 'controller/application_history_list_async_value_controller.dart';
import 'controller/authentication_controller.dart';
import 'controller/bottom_tab_controller.dart';
import 'controller/calendar_controller.dart';
import 'controller/master_controller.dart';
import 'controller/setting_controller.dart';
import 'controller/user_controller.dart';
import 'state/bottom_tab/bottom_tab_state.dart';

// ref. https://riverpod.dev/docs/concepts/providers/#creating-a-provider
//   Note
//     Do not be afraid by the global aspect of providers.
//     Providers are fully immutable. Declaring a provider is no different from declaring a function, and is testable and maintainable.

/// ユーザプロバイダ
final userProvider =
    StateNotifierProvider.autoDispose<UserController, UserState>(
  (ref) => UserController(),
);

/// 認証リポジトリプロバイダ
final authenticationRepositoryProvider = UniversalPlatform.isWeb
    ? Provider.autoDispose((_) => AuthenticationRepositoryWebImpl())
    : Provider.autoDispose((_) => AuthenticationRepositoryNativeImpl());

/// 認証プロバイダ(認証リポジトリプロバイダをDI)
final authenticationProvider = StateNotifierProvider.autoDispose<
    AuthenticationController, AsyncValue<UserModel>>(
  (ref) => AuthenticationController(
    ref,
    ref.read(authenticationRepositoryProvider),
  ),
);

/// カレンダープロバイダ
final calendarProvider =
    StateNotifierProvider.autoDispose<CalendarController, CalendarState>(
  (ref) => CalendarController(ref),
);

/// 申請リポジトリプロバイダ
final applicationRepositoryProvider = UniversalPlatform.isWeb
    ? Provider.autoDispose((_) => ApplicationRepositoryWebImpl())
    : Provider.autoDispose((_) => ApplicationRepositoryNativeImpl());

/// 申請プロバイダ
final applicationProvider =
    StateNotifierProvider.autoDispose<ApplicationController, ApplicationState>(
  (ref) => ApplicationController(
    ref,
  ),
);

/// 申請プロバイダ(AsyncValue)
final applicationAsyncValueProvider = StateNotifierProvider.autoDispose<
    ApplicationAsyncValueController, AsyncValue<ApplicationModel>>(
  (ref) => ApplicationAsyncValueController(
    ref,
    ref.read(applicationRepositoryProvider),
  ),
);

/// 申請履歴プロバイダ
final applicationHistoryProvider = StateNotifierProvider.autoDispose<
    ApplicationHistoryController, ApplicationHistoryState>(
  (ref) => ApplicationHistoryController(
    ref.read(applicationRepositoryProvider),
  ),
);

/// ボトムナビゲーションプロバイダ
final bottomTableProvider =
    StateNotifierProvider.autoDispose<BottomTabController, BottomTabState>(
  (ref) => BottomTabController(),
);

/// 設定プロバイダ
final settingProvider =
    StateNotifierProvider.autoDispose<SettingController, SettingState>(
  (ref) => SettingController(),
);

/// マスタリポジトリプロバイダ
final masterRepositoryProvider = UniversalPlatform.isWeb
    ? Provider.autoDispose((_) => MasterRepositoryWebImpl())
    : Provider.autoDispose((_) => MasterRepositoryNativeImpl());

/// マスタプロバイダ
final masterProvider = StateNotifierProvider<MasterController, MasterState>(
  (ref) => MasterController(
    ref.read(masterRepositoryProvider),
  ),
);

/// 申請履歴プロバイダ(AsyncValue)
final applicationHistoryAsyncValueProvider = StateNotifierProvider.autoDispose<
    ApplicationHistoryAsyncValueController, AsyncValue<ApplicationModel>>(
  (ref) => ApplicationHistoryAsyncValueController(
    ref,
    ref.read(applicationRepositoryProvider),
  ),
);

/// 申請履歴リストプロバイダ(AsyncValue)
final applicationHistoryListAsyncValueProvider =
    StateNotifierProvider.autoDispose<
        ApplicationHistoryListAsyncValueController,
        AsyncValue<List<ApplicationModel>>>(
  (ref) => ApplicationHistoryListAsyncValueController(
    ref,
    ref.read(applicationRepositoryProvider),
  ),
);
