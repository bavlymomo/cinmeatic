import 'package:cinmeatic/core/constants.dart';
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String title;
  const InfoRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: AppConstants.spaceSmall, bottom: AppConstants.spaceSmall),
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
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/see-all');
                  },
                  child: Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ))
          ],
        ));
  }
}
