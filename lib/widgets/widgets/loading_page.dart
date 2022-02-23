///
/// Created by Abduraimbek Yarkinov at 15:24 on 18.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SpinKitThreeBounce(
              color: Colors.white,
              duration: Duration(milliseconds: 1500),
              size: 16,
            ),
            SizedBox(height: 14),
            Text(
              "Loading",
              style: TextStyle(
                fontFamily: "InterMedium",
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
