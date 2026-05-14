import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'app_utils.dart';

class AppImagePicker {
  final List<File> fileList = [];
  File? file;
  final ImagePicker _picker = ImagePicker();

  Future<List<File?>> showAppImagePicker(
      {required BuildContext context, bool forProfile = false}) async {
    final result = await showModalBottomSheet<dynamic>(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        ),
        builder: (builder) => Wrap(
              children: [
                SafeArea(
                    child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  shrinkWrap: true,
                  children: [
                    ListTile(
                        trailing: const Icon(
                          Icons.camera_alt,
                          size: 16,
                        ),
                        title: const Text('Camera'),
                        onTap: () async {
                          file = await appImagePick(
                              source: ImageSource.camera, context: context);
                          if (file != null) {
                            fileList.add(file!);
                          }
                          Navigator.of(context).pop(fileList);
                        }),
                    ListTile(
                        trailing: const Icon(
                          Icons.image,
                          size: 16,
                        ),
                        title: const Text('Gallery'),
                        onTap: () async {
                          if (forProfile) {
                            final image = await appImagePick(context: context);
                            fileList.add(image!);
                          } else {
                            (await pickMultipleImages(context: context))
                                .map((e) => fileList.add(e!));
                          }
                          Navigator.of(context).pop(fileList);
                        })
                  ],
                ))
              ],
            ));
    return (result ?? fileList) as List<File?>;
  }

  Future<List<File>?> certificationPicker(
      {required BuildContext context}) async {
    final result = await showModalBottomSheet<dynamic>(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        ),
        builder: (builder) => Wrap(
              children: [
                SafeArea(
                    child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  shrinkWrap: true,
                  children: [
                    ListTile(
                        trailing: const Icon(
                          Icons.description,
                          size: 16,
                        ),
                        title: const Text('Select File'),
                        onTap: () async {
                          (await pickCertification())
                              .map((e) => fileList.add(e!));
                          Navigator.of(context).pop(fileList);
                        }),
                    ListTile(
                        trailing: const Icon(
                          Icons.image,
                          size: 16,
                        ),
                        title: const Text('Select Image'),
                        onTap: () async {
                          (await pickMultipleImages(context: context))
                              .map((e) => fileList.add(e!));
                          Navigator.of(context).pop(fileList);
                        })
                  ],
                ))
              ],
            ));
    return (result ?? fileList);
  }

  Future<File?> appImagePick(
      {ImageSource source = ImageSource.gallery,
      required BuildContext context}) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null && canUseImage(pickedFile.path)) {
      file = File(pickedFile.path);
    }
    return file;
  }

  Future<List<File>?> appPickMultipleFile(
      //for multiple file
      {ImageSource source = ImageSource.gallery,
      required BuildContext context}) async {
    final pickedFile = await _picker.pickMultipleMedia();
    for (final i in pickedFile) {
      if (canUseImage(i.path)) {
        fileList.add(File(i.path));
      }
    }
    return fileList;
  }

  Future<List<File?>> pickMultipleImages(
      {required BuildContext context}) async {
    final pickedFile = await _picker.pickMultiImage();
    if (pickedFile.isNotEmpty) {
      for (final i in pickedFile) {
        if (canUseImage(i.path)) {
          fileList.add(File(i.path));
        }
      }
    }
    return fileList;
  }

  Future<List<File?>> pickCertification() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: ['jpg', 'pdf', 'heic', 'png'],
    );

    if (result != null) {
      for (final i in result.files) {
        if (canUseImage(i.path!)) {
          fileList.add(File(i.path!));
        }
      }
    }
    return fileList;
  }
}
