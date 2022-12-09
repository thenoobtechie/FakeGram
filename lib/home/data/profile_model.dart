import 'package:my_flutter_test_app/common/data/user.dart';

class ProfileModel {

  User user; //For avatar and name
  int noOfPosts, followers, following;
  String bio;

  ProfileModel(this.user, this.noOfPosts, this.followers, this.following, this.bio);

  static generateProfile() => ProfileModel(User.mockUser(), 98, 2132, 152, "Some long and boring text\nwhich is created for the purpose of the bio description\nLet's hope it comes out good");
}