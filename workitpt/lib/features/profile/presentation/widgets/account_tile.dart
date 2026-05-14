import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/export.dart';
import '../pages/profile_view.dart';

class AccountTile extends StatelessWidget {
  final AccountItem item;
  final VoidCallback onTap;
  const AccountTile({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: CircleAvatar(
              backgroundColor: const Color(0x19784EFA),
              child: Image.asset(
                item.prefixIcon,
                color: colorPrimary,
              ).padding(all: 8),
            ),
            title: Text(
              item.title,
              style: AppTextStyle.bodyMDRegular.copyWith(
                color: darkText,
                letterSpacing: 0.24,
              ),
            ),
            trailing: IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.chevron_right_outlined,
              ),
            ),
            onTap: onTap,
          ),
          const Divider(
            height: 10,
            thickness: 0.2,
          ).padding(bottom: 10),
        ],
      );
}
