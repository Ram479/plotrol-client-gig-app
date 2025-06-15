// import 'package:flutter/foundation.dart';
// import 'package:plotrol/helper/api_constants.dart';
// import 'package:plotrol/model/response/book_service/file_store_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:io';
//
// class CoreRepository {
//   Future<List<FileStoreModel>> uploadFiles(List<dynamic>? paths,
//       String moduleName) async {
//     Map? respStr;
//
//     var postUri = Uri.parse(
//         "${ApiConstants.host}${ApiConstants.fileUpload}");
//     var request = http.MultipartRequest("POST", postUri);
//     if (paths != null && paths.isNotEmpty) {
//       if (paths is List<PlatformFile>) {
//         for (var i = 0; i < paths.length; i++) {
//           var path = paths[i];
//           var fileName = '${path.name}.${path.extension?.toLowerCase()}';
//           http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
//               'file', path.bytes!,
//               contentType: CommonMethods().getMediaType(fileName),
//               filename: fileName);
//           request.files.add(multipartFile);
//         }
//       } else if (paths is List<File>) {
//         for (var file in paths) {
//           request.files.add(await http.MultipartFile.fromPath('file', file.path,
//               contentType: CommonMethods().getMediaType(file.path),
//               filename: file.path
//                   .split('/')
//                   .last));
//         }
//       } else if (paths is List<CustomFile>) {
//         for (var i = 0; i < paths.length; i++) {
//           var path = paths[i];
//           var fileName = '${path.name}.${path.extension.toLowerCase()}';
//           http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
//               'file', path.bytes,
//               contentType: CommonMethods().getMediaType(fileName),
//               filename: fileName);
//           request.files.add(multipartFile);
//         }
//       }
//       request.fields['tenantId'] = GlobalVariables
//           .organisationListModel!.organisations!.first.tenantId!
//           .toString();
//       request.fields['module'] = moduleName;
//       await request.send().then((response) async {
//         if (response.statusCode == 201) {
//           respStr = json.decode(await response.stream.bytesToString());
//         }
//       });
//       if (respStr != null) {
//         return respStr?['files']
//             .map<FileStoreModel>((e) => FileStoreModelMapper.fromMap(e))
//             .toList();
//       }
//     }
//     return <FileStoreModel>[];
//   }
// }