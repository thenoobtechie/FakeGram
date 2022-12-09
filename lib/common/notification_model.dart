import 'package:my_flutter_test_app/common/constants.dart';

enum NotificationType {
  date, like, follow, comment, contact, suggestion;
}

class NotificationModel {

  //Leading:
  String userImgUrl = sampleProfileImage, username = "thenoobtechie";
  int userId = 12;

  //Body
  String message = "";

  //Trailing
  bool isFollowed = false;
  String contentImgUrl = samplePostImage;

  NotificationType type = NotificationType.like;
  String date = "2022-18-19";

  NotificationModel({this.type = NotificationType.like, this.date = "2022-18-19", this.message = "liked your picture", this.username = "being_zac"});
}