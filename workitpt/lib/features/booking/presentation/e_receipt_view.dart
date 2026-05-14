// import 'dart:io';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_media_downloader/flutter_media_downloader.dart';
// import 'package:workitpt/core/widgets/app_button.dart';
// import 'package:workitpt/core/widgets/base_view.dart';

// @RoutePage()
// class EReceiptView extends StatefulWidget {
//   const EReceiptView({super.key});

//   @override
//   State<EReceiptView> createState() => _EReceiptViewState();
// }

// class _EReceiptViewState extends State<EReceiptView> {
//   final _flutterMediaDownloaderPlugin = MediaDownload();
//   void downloadImages(String image) async {
//     try {
//       await EasyLoading.show(status: 'Downloading...');
//       _flutterMediaDownloaderPlugin.downloadFile(image,'receipt.pdf','','');
//       await EasyLoading.dismiss();
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             'Successfully downloaded...',
//             style: const TextStyle(color: Colors.white),
//           ),
//           action: SnackBarAction(
//             label: 'Dismiss',
//             textColor: Colors.white,
//             onPressed: () {
//               ScaffoldMessenger.of(context).hideCurrentSnackBar();
//             },
//           ),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } on PlatformException catch (error) {
//       print(error);
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return BaseView(
//         padding: EdgeInsets.zero,
//         titleText: 'Booking Details',
//         appBarColor: Colors.white,
//         elevation: 0,
//         body: Column(
//           children: [
//             AppButton(
//               buttonText: 'Download E-Receipt',
//               onPressed: () {
//                 downloadImages(
//                     'https://www.africau.edu/images/default/sample.pdf');
//               },
//             ),
//           ],
//         ));
//   }

// }
