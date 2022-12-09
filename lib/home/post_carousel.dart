import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_test_app/home/data/item_model.dart';

class PostCarousel extends StatefulWidget {
  final PostModel postModel;
  final Function(int, CarouselPageChangedReason) onPageChanged;
  final Function() likeCallback;

  const PostCarousel(this.postModel, this.onPageChanged, this.likeCallback,
      {Key? key})
      : super(key: key);

  @override
  State<PostCarousel> createState() => _PostCarouselState();
}

class _PostCarouselState extends State<PostCarousel> with SingleTickerProviderStateMixin {

  bool likeClicked = false;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    animation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 40.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 0.8)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 30.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(0.8)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 60.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.8, end: 0)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 40.0,
        ),
      ],
    ).animate(controller)..addListener(() {
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 400.0,
          aspectRatio: 3 / 4,
          viewportFraction: 1,
          onPageChanged: widget.onPageChanged),
      items: widget.postModel.images.map((postImage) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onDoubleTap: () async {

                widget.likeCallback();

                controller.reset();
                controller.forward();
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: postImage,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Opacity(opacity: animation.value, child: Icon(Icons.favorite, size: 100*animation.value, color: Colors.white))
                    ],
                  )),
            );
          },
        );
      }).toList(),
    );
    ;
  }
}
