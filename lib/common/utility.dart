import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_test_app/common/constants.dart';
import 'package:my_flutter_test_app/common/notification_model.dart';
import 'package:my_flutter_test_app/common/text_styles.dart';
import 'package:my_flutter_test_app/common/data/user.dart';
import 'package:my_flutter_test_app/home/data/item_model.dart';
import 'package:my_flutter_test_app/home/list_item.dart';

Widget getImageCarousel(
    PostModel postModel,
    Function(int, CarouselPageChangedReason) onPageChanged,
    Function() likeCallback) {
  return CarouselSlider(
    options: CarouselOptions(
        height: 400.0,
        aspectRatio: 3 / 4,
        viewportFraction: 1,
        onPageChanged: onPageChanged),
    items: postModel.images.map((postImage) {
      return Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onDoubleTap: () {
              likeCallback();
            },
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.amber),
                child: CachedNetworkImage(
                  imageUrl: postImage,
                  fit: BoxFit.cover,
                )),
          );
        },
      );
    }).toList(),
  );
}

Widget getProfileSection(User user) {
  return Padding(
    padding: const EdgeInsets.all(defaultPadding),
    child: Row(
      children: [
        getCircularAvatar(user.image),
        const SizedBox(width: smallPadding),
        getTitleText(user.name)
      ],
    ),
  );
}

enum ProfileAvatar {
  list, profile, other
}

Widget getCircularAvatar(String imageUrl, {ProfileAvatar avatar = ProfileAvatar.list}) {

  double dimen = getProfileAvatarDimen(avatar);
  return ClipRRect(
    borderRadius: BorderRadius.circular(dimen/2),
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      height: dimen,
      width: dimen,
    ),
  );
}

double getProfileAvatarDimen(ProfileAvatar avatar) {

  switch(avatar) {
    case ProfileAvatar.list: return 40;
    case ProfileAvatar.profile: return 80;
    default: return 100;
  }
}

Widget getTitleText(String name) =>
    Text(name, style: const TextStyle(fontWeight: FontWeight.w500));

Widget getLikeText(int likes) =>
    Text("$likes likes", style: const TextStyle(fontWeight: FontWeight.w500));

Widget getActionSection(
    bool isLiked, int selectedPage, int pageLength, Function() likeCallback) {
  return Padding(
    padding: const EdgeInsets.all(defaultPadding),
    child: Stack(
      children: [
        getPageIndicators(selectedPage, pageLength),
        Row(
          children: [
            GestureDetector(
              onTap: likeCallback,
              child: isLiked
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border),
            ),
            const SizedBox(width: defaultPadding),
            const Icon(Icons.comment),
            const SizedBox(width: defaultPadding),
            const Icon(Icons.send),
            const Spacer(),
            const Icon(Icons.save_alt)
          ],
        ),
      ],
    ),
  );
}

Widget getPageIndicators(int selectedPage, int pageLength) {
  return Center(
    child: SizedBox(
      height: 20,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CircleAvatar(
              radius: 3.5,
              backgroundColor:
                  index == selectedPage ? Colors.blue : Colors.white38),
          separatorBuilder: (context, index) =>
              const SizedBox(width: smallPadding),
          itemCount: pageLength),
    ),
  );
}

Widget getPostsList(List<PostModel> posts) {
  return ListView.builder(
      itemBuilder: (context, position) => ListItem(posts[position]),
      itemCount: posts.length);
}

Widget getBottomSection(PostModel postModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        getLikeText(postModel.likeCount),
        const SizedBox(height: smallPadding),
        getCaptionText(postModel.author.name, postModel.caption),
        const SizedBox(height: smallPadding),
        getCommentSection(postModel.author.name, postModel.comments.first.name),
        const SizedBox(height: smallPadding),
        getAddCommentSection()
      ],
    ),
  );
}

getAddCommentSection() => Row(
      children: [
        const Expanded(
          child: TextField(
              decoration: InputDecoration(
                  hintText: "Enter new comment...",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.zero)),
        ),
        GestureDetector(
          child: const SizedBox(
              height: defaultIconSize,
              width: defaultIconSize,
              child: Icon(Icons.send)),
        )
      ],
    );

Widget getCaptionText(String name, String caption) => RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "$name ",
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
        TextSpan(text: caption, style: const TextStyle(fontSize: 14)),
      ]),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );

Widget getHeaderText(String title) => Text(title,
    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));

Widget getCommentSection(String name, String comment) => RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "$name ",
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
        TextSpan(text: comment, style: const TextStyle(fontSize: 14)),
      ]),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );

Widget getNotificationListItem(NotificationModel e) => Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: smallPadding),
      child: getPreparedRow(e),
    );

Widget getPreparedRow(NotificationModel notificationModel) {
  switch (notificationModel.type) {
    case NotificationType.date:
      return getDateRow(notificationModel.date);
    case NotificationType.like:
    case NotificationType.comment:
      return getLikeRow(notificationModel);
    default:
      return getFollowRow(notificationModel);
  }
}

Widget getDateRow(date) => getHeaderText(date == "2022-11-24" ? "Today" : date);

Widget getLikeRow(e) => Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: CachedNetworkImage(
            height: 40,
            width: 40,
            imageUrl: e.userImgUrl,
          ),
        ),
        const SizedBox(width: smallPadding),
        Expanded(child: getCaptionText(e.username, e.message)),
        const SizedBox(width: smallPadding),
        CachedNetworkImage(
          height: 40,
          width: 40,
          fit: BoxFit.cover,
          imageUrl: e.contentImgUrl,
        )
      ],
    );

Widget getFollowRow(e) => Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: CachedNetworkImage(
            height: 40,
            width: 40,
            imageUrl: e.userImgUrl,
          ),
        ),
        const SizedBox(width: smallPadding),
        Expanded(child: getCaptionText(e.username, e.message)),
        const SizedBox(width: smallPadding),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all(const Size(0, 0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              textStyle: MaterialStateProperty.all(defaultTextStyle)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: smallPadding),
            child: Text("Follow", style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
