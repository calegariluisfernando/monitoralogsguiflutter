import 'package:flutter/material.dart';
import 'package:monitoralogsguiflutter/constraints.dart';

class CloudStorageInfo {
  final Widget icon;
  final String title, totalStorage;
  final int numberOfFiles, percentage;
  final Color color;

  CloudStorageInfo(
      {required this.icon,
      required this.title,
      required this.totalStorage,
      required this.numberOfFiles,
      required this.percentage,
      required this.color});
}

List<CloudStorageInfo> demoMyFiels = [
  CloudStorageInfo(
    title: "Documents",
    numberOfFiles: 1328,
    icon: Icon(
      Icons.file_copy,
      color: primaryColor,
    ),
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Google Drive",
    numberOfFiles: 1328,
    icon: Icon(
      Icons.drive_eta,
      color: Colors.orange,
    ),
    totalStorage: "1.9GB",
    color: Colors.orange,
    percentage: 45,
  ),
  CloudStorageInfo(
    title: "One Drive",
    numberOfFiles: 1328,
    icon: Icon(
      Icons.store,
      color: Colors.lightBlue,
    ),
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Documents",
    numberOfFiles: 1328,
    icon: Icon(
      Icons.account_box,
      color: Colors.blueGrey,
    ),
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 73,
  ),
];
