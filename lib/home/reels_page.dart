import 'package:flutter/material.dart';
import 'package:my_flutter_test_app/common/utility.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({Key? key}) : super(key: key);

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, alignment: Alignment.center, child: getHeaderText("Reels coming soon"),);
  }
}
