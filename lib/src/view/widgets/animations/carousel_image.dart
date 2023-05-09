import 'package:flutter/material.dart';

class CarouselImage extends StatefulWidget {
  final List<String> children;
  const CarouselImage({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  List<Widget> trackImg = [];
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      if (animation.isCompleted) {
        _changeImageIndex();
        controller.reset();
        controller.forward();
      }
    });
  }

  void _changeImageIndex() {
    setState(() {
      index++;
      if (index == widget.children.length) {
        index = 0;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image.asset(
          widget.children.elementAt(index),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.3,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.02,
              ),
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.02,
              ),
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.02,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
