import 'package:flutter/material.dart';
import 'package:my_flutter_test_app/common/constants.dart';
import 'package:my_flutter_test_app/common/utility.dart';
import 'package:my_flutter_test_app/home/bottom_navigation_bar.dart';
import 'package:my_flutter_test_app/home/data/item_model.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<PostModel> posts = [];

  @override
  void initState() {
    super.initState();
    posts = PostModel.generatePosts();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(appName),
        centerTitle: true,
      ),
      body: const CustomBottomNavigationBar(),
    );
  }
}
