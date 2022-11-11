import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/services/Shared_preferences/first_launch.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Page4 extends StatelessWidget {
  String heroTag = "tag";
  Color pageColor = Color(0xFF00BBBC);
  late AssetImage image;
  late PageController controller;
  Page4({required this.image, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width,
      height: Dimensions.height,
      child: Stack(
        children: [
          Image(
             image: image,
              fit: BoxFit.cover,
              width: Dimensions.width),
          Column(
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Dimensions.width * .3,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(16)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(pageColor)),
                    onPressed: () async {
                      await FirstLaunch.changeFirstLaunchValue().then(
                          (value) => Get.offNamed(PagesNames.startScreen));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [Icon(Icons.rocket_launch_outlined)],
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width * .1,
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    effect: SlideEffect(
                        spacing: 18.0,
                        radius: 4.0,
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: Colors.grey,
                        activeDotColor: pageColor),
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.width * .08,
              ),
            ],
          )
        ],
      ),
    );
  }
}


/**
 * 
    return Container(
      width: Dimensions.width,
      height: Dimensions.height,
      child: Column(
        children: [
          Container(
            width: Dimensions.width,
            height: Dimensions.height * .6,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: pageColor.withOpacity(.4),
                    radius: Dimensions.width * .4,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: heroTag,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Dimensions.height * .03,
                        ),
                        Image(
                          image: this.image,
                          width: Dimensions.width * .55,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  "PAPER",
                  style: TextStyle(
                      color: pageColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "WASTE",
                  style: TextStyle(
                      color: pageColor.withOpacity(.7),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Dimensions.height * .02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height * .05,
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: SlideEffect(
                      spacing: 18.0,
                      radius: 4.0,
                      dotWidth: 24.0,
                      dotHeight: 16.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: pageColor),
                )
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height * .05,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(16)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  backgroundColor: MaterialStateProperty.all<Color>(pageColor)),
              onPressed: () async {
                await FirstLaunch.changeFirstLaunchValue()
                    .then((value) => Get.offNamed(PagesNames.startScreen));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [ Icon(Icons.rocket_launch_outlined)],
              ))
        ],
      ),
    );
 */