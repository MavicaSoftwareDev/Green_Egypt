import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FeedbackHeader extends StatelessWidget {
  const FeedbackHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Dimensions.height * .02,
          ),
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_circle_left_outlined,
                    size: 22.sp,
                  ))
            ],
          ),
          SizedBox(
            height: Dimensions.height * .01,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.green,
            ),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Text(
              ' GREEN EGYPT ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 28,
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Text(
            'How was Green Egypt Experience  ?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'we appreciate feedback about your experince',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          /**
       * Divider at end of Header
       */
          Divider(
            height: 1,
            color: Colors.black54,
          )
        ],
      ),
      width: Dimensions.width,
      alignment: Alignment.center,
    );
  }
}
