import 'package:my_flutter_test_app/common/comment_model.dart';
import 'package:my_flutter_test_app/common/constants.dart';
import 'package:my_flutter_test_app/common/data/user.dart';

class PostModel {
  String name, caption;
  String? song;
  bool isSponsored = false, isLiked = false;
  int likeCount = 0, commentCount = 0;
  List<String> images = [];
  List<User> tagged = [];
  List<String> likes = [];
  List<String> tags = [];
  List<CommentModel> comments = [];
  DateTime createdAt;
  User author;

  PostModel(this.name, this.images, this.createdAt, this.author,
      {this.song,
      this.caption = "",
      this.commentCount = 0,
      this.likeCount = 0,
      this.tagged = const [],
      this.likes = const [],
      this.tags = const [],
      this.comments = const [],
      this.isSponsored = false,
      this.isLiked = false});

  static List<PostModel> generatePosts() {

    return List.generate(10, (index) => PostModel("name",
        List.generate(5, (index) => samplePostImage),
        DateTime.now(),
        User.mockUser(),
        likeCount: 1018,
        commentCount: 24,
        comments: getComments(),
        caption: "If anyone is trying to fit a circular image in app bar actions. Try below solution it should work.",
        isSponsored: true,
        tags: getTags()));
  }

  static getComments() => [
    CommentModel("AspectRatio first tries the largest width permitted by the layout constraints", DateTime.now()),
    CommentModel("If anyone is trying to fit a circular image in app bar actions. Try below solution it should work.", DateTime.now()),
    CommentModel("in this solution you can resize the image by container and clip image by clip Oval then add shadow to the image by card.", DateTime.now()),
  ];

  static getTags() => [
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "ten",
    "eleven"
  ];
}
