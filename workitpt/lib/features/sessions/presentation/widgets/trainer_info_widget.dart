import 'package:cached_network_image/cached_network_image.dart';
import 'package:workitpt/core/utils/concat_image_url.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';

class TrainerInfoWidget extends StatelessWidget {
  final String name;
  final String avatar;
  final Color titleColor;
  const TrainerInfoWidget({
    super.key,
    required this.name,
    required this.avatar,
    this.titleColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: CachedNetworkImageProvider(concatImageUrl(avatar)),
                  fit: BoxFit.cover),
              border: Border.all(
                width: 0.5,
                color: colorPrimary,
              ),
            ),
          ),
          horizontalMargin4,
          Text(
            name,
            style: AppTextStyle.subHeadLgBold.copyWith(color: titleColor),
            overflow: TextOverflow.ellipsis,
          ).flexible(),
        ],
      );
}
