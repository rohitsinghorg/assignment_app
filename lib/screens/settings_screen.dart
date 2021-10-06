import 'package:assignment_app/utils/app_colors.dart';
import 'package:assignment_app/utils/app_text_styles.dart';
import 'package:assignment_app/widget/app_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPercentage = MediaQuery.of(context).size.width / 100;
    double heightPercentage = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: AppTextStyles.style16.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widthPercentage * 10, // 10% of the width
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: heightPercentage * 10, // 10% of the height
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Boat Number:",
                    style: AppTextStyles.style16,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: widthPercentage * 5, // 5% of the width
                ),
                Expanded(
                  child: Text(
                    "32",
                    style: AppTextStyles.style16.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: heightPercentage, // 1% of the height
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Boat Name:",
                    style: AppTextStyles.style16,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: widthPercentage * 5, // 5% of the width
                ),
                Expanded(
                  child: Text(
                    "Blue Ship 1",
                    style: AppTextStyles.style16.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
