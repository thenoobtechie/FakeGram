import 'package:flutter/material.dart';
import 'package:my_flutter_test_app/common/constants.dart';
import 'package:my_flutter_test_app/common/utility.dart';
import 'package:my_flutter_test_app/home/data/profile_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late ProfileModel profileModel;

  @override
  void initState() {
    profileModel = ProfileModel.generateProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        getHeader(),
        // getHighLightSection(),
        // getBody()
      ],
    );
  }

  Widget getHighLightSection() => SliverToBoxAdapter(child: Container());

  Widget getBody() => SliverToBoxAdapter(child: Container());

  Widget getHeader() => SliverToBoxAdapter(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        getProfileRow()
      ],
    ),
  );

  Widget getProfileRow() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: [
            getCircularAvatar(profileModel.user.image, avatar: ProfileAvatar.profile),
            Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(defaultIconSize),
                  border: Border.all(color: Colors.black, width: 1.5)
                ),
                child: const Padding(
                    padding: EdgeInsets.all(2),
                    child: Icon(Icons.add, size: 18))),
        ],
      ),
      getTitleAndLabelWidget("${profileModel.noOfPosts}", "Posts"),
      getTitleAndLabelWidget("${profileModel.followers}", "Followers"),
      getTitleAndLabelWidget("${profileModel.following}", "Following"),
    ],
  );

  Widget getTitleAndLabelWidget(String title, String label) => Column(
    children: [
      Text(title),
      Text(label)
    ],
  );
}
