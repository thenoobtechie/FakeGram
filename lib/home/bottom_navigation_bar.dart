import 'package:flutter/material.dart';
import 'package:my_flutter_test_app/common/constants.dart';
import 'package:my_flutter_test_app/common/utility.dart';
import 'package:my_flutter_test_app/home/data/item_model.dart';
import 'package:my_flutter_test_app/home/home_page.dart';
import 'package:my_flutter_test_app/home/notifications_page.dart';
import 'package:my_flutter_test_app/home/profile_page.dart';
import 'package:my_flutter_test_app/home/reels_page.dart';
import 'package:my_flutter_test_app/home/search_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentPage = 0;
  List<PostModel> posts = [];

  @override
  void initState() {
    super.initState();
    posts = PostModel.generatePosts();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          children: [
            getPage(0, getPostsList(posts)),
            getPage(1, const SearchPage()),
            getPage(2, const ReelsPage()),
            getPage(3, const NotificationsPage()),
            getPage(4, const ProfilePage())
          ],
        ),
        BottomNavigationBar(
          items: [
            getItem(0, "Home", Icons.home, Icons.home_filled, (int index) {}),
            getItem(1, "Search", Icons.search, Icons.manage_search, (int index) {}),
            getItem(2, "Reels", Icons.movie_creation_outlined, Icons.movie, (int index) {}),
            getItem(3, "Notifications", Icons.favorite_border, Icons.favorite, (int index) {}),
            getItem(4, "Profile", Icons.person_outline, Icons.person, (int index) {}),
          ],
          onTap: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          fixedColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontSize: 0),
          currentIndex: currentPage,
        ),
      ],
    );
  }

  getItem(int index, String name, IconData iconData, IconData activeIcon,
      Function(int index) onSelected) {
    return BottomNavigationBarItem(
        icon: getIcon(iconData, index),
        label: name, activeIcon: getIcon(activeIcon, -1));
  }

  Widget getPage(int index, Widget childWidget) {
    return Offstage(
      offstage: currentPage != index,
      child: childWidget,
    );
  }

  Widget getIcon(IconData iconData, int index) {
    return Column(
      children: [
        Icon(iconData),
        const SizedBox(height: 4),
        Visibility(
          visible: index == -1,
          maintainSize: true,
          maintainState: true,
          maintainAnimation: true,
          child: const CircleAvatar(radius: 2, backgroundColor: Colors.red),
        )
      ],
    );
  }
}
