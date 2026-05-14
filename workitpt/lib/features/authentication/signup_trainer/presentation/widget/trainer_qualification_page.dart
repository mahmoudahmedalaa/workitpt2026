import 'dart:io';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/utils/app_image_picker.dart';
import '../../../../../core/utils/spacing_utils.dart';
import 'certificate_widget.dart';
import 'no_certificate_widget.dart';

class TrainerQualificationWidget extends StatefulWidget {
  final List<File> fileList;
  final List<String> certificationList;
  const TrainerQualificationWidget(
      {super.key, required this.fileList, required this.certificationList});

  @override
  State<TrainerQualificationWidget> createState() =>
      _TrainerQualificationWidgetState();
}

class _TrainerQualificationWidgetState
    extends State<TrainerQualificationWidget> {
  List<File?> selectedFiles = [];
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Qualification',
              style: AppTextStyle.titleMDSemiBold,
            ),
            verticalSpacing(space: 8),
            Text('This help us create your personalized plan',
                style: AppTextStyle.bodySMRegular.copyWith(color: darkText)),
            verticalMargin32,
            if (widget.fileList.isEmpty && widget.certificationList.isEmpty)
              NoCertificateWidget(
                onPressed: () async {
                  final pickedFiles = await AppImagePicker()
                      .certificationPicker(context: context);
                  if (pickedFiles != null) {
                    setState(
                      () {
                        widget.fileList.addAll(pickedFiles);
                      },
                    );
                  }
                },
              )
            else
              CertificateWidget(
                fileList: widget.fileList,
                certificationList: widget.certificationList,
                onPressed: () async {
                  final pickedFiles = await AppImagePicker()
                      .certificationPicker(context: context);
                  if (pickedFiles != null) {
                    setState(
                      () {
                        widget.fileList.addAll(pickedFiles);
                      },
                    );
                  }
                },
              ),
          ],
        ),
      );
}
