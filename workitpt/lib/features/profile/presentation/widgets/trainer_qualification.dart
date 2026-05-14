import 'dart:io';

import '../../../../core/export.dart';
import '../../../../core/utils/app_image_picker.dart';
import '../../../authentication/signup_trainer/presentation/widget/certificate_widget.dart';
import '../../../authentication/signup_trainer/presentation/widget/no_certificate_widget.dart';

class QualificationWidget extends StatefulWidget {
  final List<File> fileList;
  final List<String> certificationList;
  const QualificationWidget(
      {super.key, required this.fileList, required this.certificationList});

  @override
  State<QualificationWidget> createState() => _QualificationWidgetState();
}

class _QualificationWidgetState extends State<QualificationWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.certificationList.isEmpty && widget.fileList.isEmpty)
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
        ),
      ).padding(horizontal: 24);
}
