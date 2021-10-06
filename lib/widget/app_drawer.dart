import 'package:assignment_app/screens/offload_screen.dart';
import 'package:assignment_app/screens/settings_screen.dart';
import 'package:assignment_app/utils/app_colors.dart';
import 'package:assignment_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPercentage = MediaQuery.of(context).size.width / 100;
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: widthPercentage * 2,
        ),
        color: AppColors.primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "user@email.com",
                    style: AppTextStyles.style16.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    constraints: BoxConstraints(),
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.close,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            DrawerItemWidget(
              title: "Offload Manager",
              onClick: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OffloadScreen(),
                  ),
                );
              },
            ),
            DrawerItemWidget(
              title: "Settings",
              onClick: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItemWidget extends StatelessWidget {
  final String title;
  final VoidCallback onClick;

  DrawerItemWidget({
    Key? key,
    required this.title,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.style16.copyWith(
          color: AppColors.whiteColor,
        ),
      ),
      onTap: onClick,
    );
  }
}
