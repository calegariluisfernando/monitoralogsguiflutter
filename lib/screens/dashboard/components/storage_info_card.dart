import 'package:flutter/material.dart';

import '../../../constraints.dart';

class StorageInfoCard extends StatelessWidget {
  const StorageInfoCard({Key? key, required this.title, required this.amountOfFiles, required this.numberOfFiles, required this.icon}) : super(key: key);

  final String title, amountOfFiles;
  final int numberOfFiles;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: primaryColor.withOpacity(0.15),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: icon,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '$numberOfFiles Files',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          Text(amountOfFiles),
        ],
      ),
    );
  }
}