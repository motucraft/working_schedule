import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/model/application_model.dart';
import '../../view/application/application_detail.dart';
import '../../view/component/background_cancel.dart';
import '../../view_model/controller/application_history_controller.dart';
import '../../view_model/controller/application_history_list_async_value_controller.dart';
import '../../view_model/controller/master_controller.dart';
import '../../view_model/provider.dart';
import '../../view_model/state/application_history/application_history_state.dart';
import '../../view_model/util/application_type.dart';
import '../../view_model/util/const.dart';

class ApplicationHistoryAsyncListView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final applicationHistoryListAsyncValueController =
        useProvider(applicationHistoryListAsyncValueProvider.notifier);
    final applicationHistoryState = useProvider(applicationHistoryProvider);
    final applicationHistoryListAsyncValue =
        useProvider(applicationHistoryListAsyncValueProvider);
    final applicationHistoryController =
        useProvider(applicationHistoryProvider.notifier);
    final masterController = useProvider(masterProvider.notifier);

    return applicationHistoryListAsyncValue.when(
      data: (applicationHistoryList) {
        return ListView.builder(
          itemCount: applicationHistoryList.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return _applicationItem(
              context,
              masterController,
              applicationHistoryController,
              applicationHistoryListAsyncValueController,
              applicationHistoryState,
              applicationHistoryList[index],
            );
          },
        );
      },
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (e, stack) {
        return Container();
      },
    );
  }

  Widget _applicationItem(
      BuildContext context,
      MasterController masterController,
      ApplicationHistoryController applicationHistoryController,
      ApplicationHistoryListAsyncValueController
          applicationHistoryListAsyncValueController,
      ApplicationHistoryState applicationHistoryState,
      ApplicationModel applicationHistoryModel) {
    // true : ????????????
    bool isWork = ApplicationType.Work ==
        ApplicationTypeExtension.fromString(
            applicationHistoryModel.applicationType);

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        // ????????????????????????
        await applicationHistoryListAsyncValueController
            .getApplicationsByMonth(applicationHistoryState.monthFilter);

        final dialog = AwesomeDialog(
          context: context,
          animType: AnimType.LEFTSLIDE,
          headerAnimationLoop: false,
          dialogType: DialogType.SUCCES,
          title: 'Success',
          desc: applicationHistoryModel.workingDay.year.toString() +
              '???' +
              applicationHistoryModel.workingDay.month
                  .toString()
                  .padLeft(2, '0') +
              '???' +
              applicationHistoryModel.workingDay.day
                  .toString()
                  .padLeft(2, '0') +
              '???????????????????????????????????????',
          btnOkIcon: Icons.check_circle,
          autoHide: Duration(seconds: 2),
        );

        await dialog.show();
      },
      confirmDismiss: (direction) async {
        // ???????????????????????????
        return await _confirmDismiss(
            context,
            direction,
            applicationHistoryController,
            applicationHistoryListAsyncValueController,
            applicationHistoryModel);
      },
      background: BackgroundCancel(),
      child: Card(
        elevation: 5.0,
        child: InkWell(
          onTap: () {
            // ?????????????????????????????????
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    ApplicationDetail(applicationHistoryModel),
              ),
            );
          },
          child: ListTile(
            leading: isWork
                ? Icon(
                    Icons.work,
                    color: Colors.blue,
                  )
                : Icon(
                    Icons.work_off,
                    color: Colors.red,
                  ),
            minLeadingWidth: 20,
            contentPadding: EdgeInsets.only(left: 15),
            // isThreeLine: true,
            title: Text(
              Const.dateFormatOfTheWeek
                  .format(applicationHistoryModel.workingDay),
            ),
            subtitle: isWork
                ? Row(
                    children: [
                      Text('?????????'),
                      Text(
                        Const.timeFormat.format(applicationHistoryModel.start!),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('?????????'),
                      Text(
                        Const.timeFormat.format(applicationHistoryModel.end!),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Text('???????????????'),
                      Text(
                        masterController.getLeaveTypeName(
                            applicationHistoryModel.leaveTypeId!),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  // ???????????????????????????
  Future<bool?> _confirmDismiss(
      BuildContext context,
      DismissDirection direction,
      ApplicationHistoryController applicationHistoryController,
      ApplicationHistoryListAsyncValueController
          applicationHistoryListAsyncValueController,
      ApplicationModel applicationHistoryModel) async {
    bool? res = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('?????????????????????????????????????????????????????????'),
          actions: [
            TextButton(
              child: Text(
                '???????????????',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () async {
                // ??????(??????????????????)
                await applicationHistoryController
                    .deleteApplication(applicationHistoryModel.workingDay);
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    return res;
  }
}
