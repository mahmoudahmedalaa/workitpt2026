import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/export.dart';

class SpecializationChip extends StatelessWidget {
  final String chipTitle;
  const SpecializationChip({super.key, required this.chipTitle});

  @override
  Widget build(BuildContext context) => Chip(
        label: Container(
          constraints: BoxConstraints(
            maxWidth: 100,
          ),
          child: Text(
            chipTitle,
            style: AppTextStyle.tinySMRegular.copyWith(color: colorPrimary),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        padding: const EdgeInsets.only(bottom: 4),
        backgroundColor: colorPrimary.withOpacity(0.2),
        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
        visualDensity: const VisualDensity(
          vertical: VisualDensity.minimumDensity,
          horizontal: VisualDensity.minimumDensity,
        ),
      ).height(20).padding(right: 4, bottom: 4);
}
