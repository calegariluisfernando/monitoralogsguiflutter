import 'package:flutter/material.dart';
import 'package:monitoralogsguiflutter/screens/dashboard/components/storage_info_card.dart';

import '../../../constraints.dart';
import 'chart.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Storage Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Chart(),
          StorageInfoCard(
            icon: Icon(
              Icons.file_copy,
              color: primaryColor,
            ),
            title: 'Document Files',
            amountOfFiles: '1.3GB',
            numberOfFiles: 1328,
          ),
          StorageInfoCard(
            icon: Icon(
              Icons.play_circle,
              color: Color(0xFF26E5FF),
            ),
            title: 'Media Files',
            amountOfFiles: '15.3GB',
            numberOfFiles: 1328,
          ),
          StorageInfoCard(
            icon: Icon(
              Icons.attach_file_sharp,
              color: Color(0xFFFFCF26),
            ),
            title: 'Other Files',
            amountOfFiles: '1.3GB',
            numberOfFiles: 1328,
          ),
          StorageInfoCard(
            icon: Icon(
              Icons.device_unknown,
              color: Color(0xFFEE2727),
            ),
            title: 'Unknow',
            amountOfFiles: '1.3GB',
            numberOfFiles: 1328,
          ),
        ],
      ),
    );
  }
}
