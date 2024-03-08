import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tengemate/util/dimensiona.dart';
import 'package:tengemate/util/images.dart';

class ClickableProfileWidget extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final String icon;
  final bool isLogout;

  const ClickableProfileWidget(
      {Key? key,
      required this.icon,
      required this.title,
      this.isLogout = false,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.all(
          Dimensions.paddingSizeDefault,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  width: 18,
                  height: 18,
                  color:isLogout?Colors.red: Theme.of(context).dividerColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: isLogout?Colors.red:Theme.of(context).dividerColor
                      ),
                ),
              ],
            ),
            if(!isLogout)
            SvgPicture.asset(
              Images.arrowforward,
              width: 18,
              height: 18,
              color: Theme.of(context).dividerColor,
            ),
          ],
        ),
      ),
    );
  }
}
