import 'package:assignment_app/provider/offload_provider.dart';
import 'package:assignment_app/screens/grading_screen.dart';
import 'package:assignment_app/utils/app_colors.dart';
import 'package:assignment_app/utils/app_text_styles.dart';
import 'package:assignment_app/widget/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OffloadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPercentage = MediaQuery.of(context).size.width / 100;
    double heightPercentage = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Offload",
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
              height: heightPercentage * 2, // 2% of the height
            ),
            Text(
              "Pick your fish",
              style: AppTextStyles.style18.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: heightPercentage * 10, // 10% of the height
            ),
            Row(
              children: [
                Container(
                  width: widthPercentage * 15,
                  child: Text(
                    'IMG'.toUpperCase(),
                    style: AppTextStyles.style16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: widthPercentage * 2,
                ),
                Expanded(
                  child: Text(
                    'Title'.toUpperCase(),
                    style: AppTextStyles.style16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: widthPercentage * 2,
                ),
                Text(
                  "Quantity".toUpperCase(),
                  style: AppTextStyles.style16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: heightPercentage,
            ),
            Consumer<OffloadProvider>(builder: (
              context,
              model,
              child,
            ) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GradingScreen(
                            itemIndex: index,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: heightPercentage,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: widthPercentage * 15,
                            height: widthPercentage * 15,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(
                                widthPercentage,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: widthPercentage * 2,
                          ),
                          Expanded(
                            child: Text(
                              model.offloadList[index].title ?? '-',
                              style: AppTextStyles.style16,
                            ),
                          ),
                          SizedBox(
                            width: widthPercentage * 2,
                          ),
                          Text(
                            model.offloadList[index].quantity.toString(),
                            style: AppTextStyles.style16.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: model.offloadList.length,
              );
            }),
            SizedBox(
              height: heightPercentage,
            ),
            Container(
              height: 1,
              color: AppColors.greyColor,
            ),
            SizedBox(
              height: heightPercentage,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Total Quantity".toUpperCase(),
                    style: AppTextStyles.style16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Consumer<OffloadProvider>(
                    builder: (context, model, child) => Text(
                      model.totalQuantity.toString(),
                      textAlign: TextAlign.right,
                      style: AppTextStyles.style16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
