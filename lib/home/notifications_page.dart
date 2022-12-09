import 'package:flutter/material.dart';
import 'package:my_flutter_test_app/common/notification_model.dart';
import 'package:my_flutter_test_app/common/utility.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {


  List<NotificationModel> notifications = [];

  @override
  void initState() {
    super.initState();
    notifications.add(NotificationModel(type: NotificationType.date, date: "2022-11-24"));
    notifications.add(NotificationModel());
    notifications.add(NotificationModel());
    notifications.add(NotificationModel(type: NotificationType.comment, message: "commented on the picture you shared"));
    notifications.add(NotificationModel(type: NotificationType.date, date: "2022-11-23"));
    notifications.add(NotificationModel(type: NotificationType.follow, message: "started following you", username: "the_random_ninja"));
    notifications.add(NotificationModel(type: NotificationType.follow, message: "started following you", username: "one.two.three"));
    notifications.add(NotificationModel(type: NotificationType.date, date: "2022-11-22"));
    notifications.add(NotificationModel(type: NotificationType.follow, message: "started following you", username: "the_random_ninja"));
    notifications.add(NotificationModel(type: NotificationType.follow, message: "started following you", username: "one.two.three"));
    notifications.add(NotificationModel(type: NotificationType.date, date: "2022-11-18"));
    notifications.add(NotificationModel(type: NotificationType.follow, message: "started following you", username: "the_random_ninja"));
    notifications.add(NotificationModel(type: NotificationType.date, date: "2022-11-15"));
    notifications.add(NotificationModel(type: NotificationType.follow, message: "started following you", username: "the_random_ninja"));
    notifications.add(NotificationModel(type: NotificationType.follow, message: "started following you", username: "one.two.three"));
    notifications.add(NotificationModel(type: NotificationType.comment, message: "commented on the picture you shared"));
    notifications.add(NotificationModel(type: NotificationType.follow, message: "started following you", username: "one.two.three"));
    notifications.add(NotificationModel(type: NotificationType.date, date: "2022-11-07"));
    notifications.add(NotificationModel());
    notifications.add(NotificationModel());
    notifications.add(NotificationModel(type: NotificationType.follow, message: "started following you", username: "the_random_ninja"));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: ListView(
            padding: const EdgeInsets.only(bottom: 60),
            children: notifications.map((e) => getNotificationListItem(e)).toList(),
          ),
        )
      ],
    );
  }
}
