import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_flutter_test_app/common/constants.dart';
import 'package:my_flutter_test_app/common/text_styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: CupertinoSearchTextField(
            placeholder: "Enter your search text here",
            padding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: mediumPadding),
            style: defaultTextStyle,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              children: List.generate(
                  40,
                  (index) => CachedNetworkImage(
                        imageUrl: samplePostImage,
                        fit: BoxFit.cover,
                        height: index %3 == 0 ? MediaQuery.of(context).size.width / 3 : MediaQuery.of(context).size.width / 3,
                        width: MediaQuery.of(context).size.width / 3,
                      )),
            ),
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
