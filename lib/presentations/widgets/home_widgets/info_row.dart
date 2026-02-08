import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  double screenHeight;
  double screenWidth;
  String title;
    InfoRow(
      {required this.screenHeight,
      required this.screenWidth,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: screenHeight * 0.05, bottom: screenHeight * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {},
                child: Text(
                  "See All",
                  style: Theme.of(context).textTheme.labelSmall,
                ))
          ],
        ));
  }
}
