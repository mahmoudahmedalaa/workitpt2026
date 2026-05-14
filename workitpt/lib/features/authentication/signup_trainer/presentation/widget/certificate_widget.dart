import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../../../core/utils/concat_image_url.dart';
import '../../../../../core/widgets/app_button.dart';

class CertificateWidget extends StatefulWidget {
  final List<File?> fileList;
  final List<String> certificationList;
  final VoidCallback onPressed;

  const CertificateWidget(
      {super.key,
      required this.fileList,
      required this.certificationList,
      required this.onPressed});

  @override
  State<CertificateWidget> createState() => _CertificateWidgetState();
}

class _CertificateWidgetState extends State<CertificateWidget> {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Your Certificate',
            style: AppTextStyle.bodySMRegular.copyWith(
              color: darkText,
              letterSpacing: 0.20,
            ),
          ),
          verticalMargin24,
          Visibility(
            visible: widget.certificationList.isNotEmpty,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.certificationList.length,
              itemBuilder: (context, index) => ListTile(
                tileColor: const Color(0x19F97316),
                title: Text(
                  widget.certificationList[index].split('/').last,
                  style: AppTextStyle.bodyMDSemiBold.copyWith(
                    height: 1.20,
                    letterSpacing: 0.28,
                  ),
                ),
                leading: widget.certificationList[index].contains('.pdf')
                    ? const Icon(
                        Icons.description,
                        color: colorPrimary,
                        size: 40,
                      )
                    : CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          concatImageUrl(widget.certificationList[index]),
                        ),
                      ),
                trailing: const Icon(
                  Icons.delete_forever,
                  color: colorPrimary,
                ).gestures(onTap: () {
                  widget.certificationList.removeAt(index);
                  setState(() {});
                }),
                subtitle: const Text(''),
              ).padding(bottom: 8),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.fileList.length,
            itemBuilder: (context, index) => ListTile(
              tileColor: const Color(0x19F97316),
              title: Text(
                widget.fileList[index]!.path.split('/').last,
                style: AppTextStyle.bodyMDSemiBold.copyWith(
                  height: 1.20,
                  letterSpacing: 0.28,
                ),
              ),
              leading: widget.fileList[index]!.path.contains('.pdf')
                  ? const Icon(
                      Icons.description,
                      color: colorPrimary,
                      size: 40,
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(
                        widget.fileList[index]!,
                      ),
                    ),
              trailing: const Icon(
                Icons.delete_forever,
                color: colorPrimary,
              ).gestures(onTap: () {
                widget.fileList.removeAt(index);
                setState(() {});
              }),
              subtitle: Text(
                getFileSize(widget.fileList[index]!.path),
                style: AppTextStyle.bodySMRegular.copyWith(
                  color: const Color(0xFF59798F),
                  height: 1.80,
                  letterSpacing: 0.24,
                ),
              ),
            ).padding(bottom: 8),
          ),
          const Divider(),
          AppButton(
            onPressed: widget.onPressed,
            buttonText: 'Add another Certificate',
            textColor: colorPrimary,
            backgroundColor: const Color(0xFFFDD4B7),
            prefixWidget: const Icon(
              Icons.add_box_outlined,
              color: colorPrimary,
            ),
            suffixWidget: const SizedBox(),
          )
        ],
      );
}
