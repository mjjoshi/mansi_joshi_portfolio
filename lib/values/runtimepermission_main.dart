// import 'package:andiccio_flutter/values/strings_name.dart';
// import 'package:andiccio_flutter/values/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// //https://medium.com/flutter-community/flutter-image-uploader-with-app-permissions-and-compression-using-getit-services-59ffea13f913
// class RuntimePermissions extends StatefulWidget {
//   const RuntimePermissions({super.key});
//
//   Future<bool> permissionServiceCall() async {
//     bool checkStatus = false;
//     await permissionServices().then(
//       (value) {
//         if (value[Permission.location]!.isGranted) {
//           checkStatus = true;
//         } else {
//           checkStatus = false;
//         }
//       },
//     );
//     return checkStatus;
//   }
//
//   Future<Map<Permission, PermissionStatus>> permissionServices() async {
//     Map<Permission, PermissionStatus> statuses;
//     statuses = await [Permission.location].request();
//     if (statuses[Permission.location] != null && statuses[Permission.location] == PermissionStatus.permanentlyDenied) {
//       Utils.showPermissionDialog(StringNames.allowPermission, Permission.location.status);
//     } else {
//       permissionServiceCall();
//     }
//     return statuses;
//   }
//
//   @override
//   State<StatefulWidget> createState() => throw UnimplementedError();
// }
