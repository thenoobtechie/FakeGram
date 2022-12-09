import 'package:my_flutter_test_app/common/constants.dart';

class User {
  String name, image;
  User(this.name, this.image);

  static mockUser() => User("thenoobtechie", sampleProfileImage);
}