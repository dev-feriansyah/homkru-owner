import 'package:flutter/material.dart';
import 'package:homekru_owner/shared/utils/common_utils.dart';
import 'package:homekru_owner/core/constants/image_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:homekru_owner/core/routes/app_navigator.dart';
import 'package:homekru_owner/core/routes/app_routes.dart';
import 'package:homekru_owner/core/theme/app_colors.dart';
import 'package:homekru_owner/shared/widgets/custom_elevated_button.dart';
import 'package:homekru_owner/shared/widgets/custom_image_view.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';

class WouldYouLikeScreen extends StatefulWidget {
  const WouldYouLikeScreen({super.key});

  @override
  State<WouldYouLikeScreen> createState() => _WouldYouLikeScreenState();
}

class _WouldYouLikeScreenState extends State<WouldYouLikeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            CustomImageView(
              imagePath: ImageConstant.homeKruLogo,
              height: 1.sw * 0.2,
            ),
            SizedBox(height: 50),
            Expanded(
              child: Container(
                // alignment: Alignment.center,
                width: 1.sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Stack(
                  children: [
                    bottomWaveWidget(),
                    // Positioned(
                    //   bottom: 0,
                    //   left: 0,
                    //   child: CustomImageView(
                    //     imagePath: ImageConstant.backgroundImage2,
                    //     height: 200,
                    //   ),
                    // ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CText(
                                "Would you like to",
                                weight: FontWeight.w800,
                                size: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: CText(
                                "Book a helper now or explore more\nservices?",
                                textAlign: TextAlign.center,
                                color: appColors.grey,
                                weight: FontWeight.w300,
                                size: 16,
                              ),
                            ),
                            SizedBox(height: 35),
                            customContainer("owner"),
                            SizedBox(height: 15),
                            customContainer("co-owner"),

                            SizedBox(height: 30),
                            CustomElevatedButton(
                              onPressed: () {
                                AppNavigator.pushNamed(
                                  AppRoutes.createHousehold,
                                );
                              },
                              text: "Continue",
                              buttonTextStyle: TextStyle(
                                color: appColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              buttonStyle: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  appColors.primaryColor,
                                ),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            CustomElevatedButton(
                              onPressed: () {
                                AppNavigator.pop();
                              },
                              text: "Back",
                              buttonTextStyle: TextStyle(
                                color: appColors.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              buttonStyle: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  appColors.white,
                                ),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                side: WidgetStateProperty.all(
                                  BorderSide(color: appColors.primaryColor),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customContainer(label) {
    return GestureDetector(
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              (label == "owner") ? appColors.paleGreen : appColors.paleOrange,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    (label == "owner")
                        ? appColors.lightGreen
                        : appColors.lightOrange,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.add,
                color: (label == "owner") ? appColors.brightGreen : null,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CText(
                      "Create a new household",
                      size: 16,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(height: 4),
                    CText(
                      "Primary account owner",
                      size: 14,
                      weight: FontWeight.w400,
                      color: appColors.grey,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 5),
            Container(
              margin: EdgeInsets.only(top: 7),
              height: 20,
              width: 20,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appColors.white,
                border: Border.all(
                  color:
                      (label == "owner")
                          ? appColors.brightGreen
                          : appColors.orange,
                  width: 2,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      (label == 'owner'
                          ? appColors.brightGreen
                          : appColors.orange),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
