import 'package:assignment_app/provider/offload_provider.dart';
import 'package:assignment_app/utils/app_colors.dart';
import 'package:assignment_app/utils/app_text_styles.dart';
import 'package:assignment_app/widget/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

final GlobalKey<FormState> gradingFormKey = GlobalKey();

class GradingScreen extends StatelessWidget {
  final int itemIndex;

  GradingScreen({
    required this.itemIndex,
  });

  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widthPercentage = MediaQuery.of(context).size.width / 100;
    double heightPercentage = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Grading",
          style: AppTextStyles.style16.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widthPercentage * 25,
          vertical: heightPercentage,
        ),
        child: ElevatedButton(
          onPressed: () {
            if (gradingFormKey.currentState!.validate()) {
              Provider.of<OffloadProvider>(context, listen: false)
                  .updateQuantityByIndex(itemIndex, int.parse(weightController.text.trim()));
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(
            primary: AppColors.primaryColor,
            elevation: 0,
            padding: EdgeInsets.symmetric(
              vertical: heightPercentage * 1.5,
            ),
          ),
          child: Text(
            "Add to Total",
            style: AppTextStyles.style16.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: heightPercentage * 2, // 2% of the height
          ),
          Consumer<OffloadProvider>(
            builder: (context, model, child) {
              return Text(
                model.offloadList[itemIndex].title ?? '-',
                style: AppTextStyles.style18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              );
            },
          ),
          SizedBox(
            height: heightPercentage * 10, // 10% of the height
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widthPercentage * 5,
            ),
            child: Form(
              key: gradingFormKey,
              child: TextFormField(
                controller: weightController,
                maxLength: 3,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Please enter some weight";
                  } else
                    return null;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                style: AppTextStyles.style16,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                  decimal: false,
                ),
                decoration: InputDecoration(
                  labelText: "Weight",
                  labelStyle: AppTextStyles.style16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: widthPercentage * 5,
                    vertical: heightPercentage * 2.5,
                  ),
                  counterText: "",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.redColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
