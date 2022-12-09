import 'package:flutter/cupertino.dart';
import 'package:my_flutter_test_app/common/utility.dart';
import 'package:my_flutter_test_app/home/data/item_model.dart';
import 'package:my_flutter_test_app/home/post_carousel.dart';

class ListItem extends StatefulWidget {

  final PostModel postModel;
  const ListItem(this.postModel, {Key? key}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {


  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
          getProfileSection(widget.postModel.author),
          PostCarousel(widget.postModel, onPageChanged, onLiked),
          getActionSection(widget.postModel.isLiked, selectedPage, widget.postModel.images.length, onLiked),
          getBottomSection(widget.postModel),
      ],
    );
  }

  onLiked() {
    setState(() {
      widget.postModel.isLiked = !widget.postModel.isLiked;
    });
  }

  onPageChanged(selectedPage, pageChangeReason) {
    setState(() {
      this.selectedPage = selectedPage;
    });
  }
}
