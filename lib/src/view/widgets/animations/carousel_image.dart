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
  //List<Widget> circleTrackImg = [];
/*  final Map<String, double> imgHgt = {
    'Screen': 0.23,
    'Dialog': 0.18,
  };*/

  @override
  void initState() {
    // for (int i = 0; i < widget.children.length; i++) {
    //   circleTrackImg.add(
    //     CircleAvatar(
    //       radius: MediaQuery.of(context).size.width * 0.02,
    //     ),
    //   );
    // }
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
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height:
                MediaQuery.of(context).size.height * 0.23,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  widget.children.elementAt(index),
                ),
                fit: BoxFit.fitWidth,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.3,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
